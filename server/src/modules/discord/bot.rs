use std::sync::OnceLock;
use std::time::Duration;

use serenity::async_trait;
use serenity::builder::{CreateInteractionResponse, GetMessages};
use serenity::model::application::{ActionRowComponent, ButtonKind, Interaction};
use serenity::model::gateway::Ready;
use serenity::model::id::{ChannelId, MessageId, UserId};
use serenity::prelude::*;

use database::AlertRepository;

use crate::{config::DiscordConfig, core::shutdown::ShutdownNotifier};

use super::{
  from_db_record, to_db_record,
  messages::{build_interaction_update, parse_component_id},
  types::{
    AlertRegistry, IssueStatus, MatchContext, PitAlert, PitAlertType,
    StatusBroadcast, TeamStatusUpdate, TeamTicketStatus,
  },
};

const RECONNECT_DELAY: Duration = Duration::from_secs(5);

static BOT_USER_ID: OnceLock<UserId> = OnceLock::new();

// ─── TypeMap keys ─────────────────────────────────────────────────────────────

struct AlertRegistryKey;
impl TypeMapKey for AlertRegistryKey {
  type Value = AlertRegistry;
}

struct StatusBroadcastKey;
impl TypeMapKey for StatusBroadcastKey {
  type Value = StatusBroadcast;
}

struct ChannelIdKey;
impl TypeMapKey for ChannelIdKey {
  type Value = ChannelId;
}

// ─── Event handler ────────────────────────────────────────────────────────────

struct Handler;

#[async_trait]
impl EventHandler for Handler {
  async fn ready(&self, ctx: Context, ready: Ready) {
    BOT_USER_ID.set(ready.user.id).ok();
    log::info!("[ArenaLink Bot] Connected as {}", ready.user.name);

    // Recover alert state from Discord channel history so flags survive server restarts.
    let bot_id = ready.user.id;
    let (registry, status_tx, channel_id) = {
      let data = ctx.data.read().await;
      (
        data.get::<AlertRegistryKey>().cloned(),
        data.get::<StatusBroadcastKey>().cloned(),
        data.get::<ChannelIdKey>().copied(),
      )
    };

    if let (Some(registry), Some(channel_id)) = (registry, channel_id) {
      recover_alert_state(&ctx, channel_id, bot_id, &registry, status_tx.as_ref()).await;
    }
  }

  async fn interaction_create(&self, ctx: Context, interaction: Interaction) {
    let Interaction::Component(component) = interaction else { return };

    let custom_id = &component.data.custom_id;
    let Some((action, station)) = parse_component_id(custom_id) else { return };

    let new_status = match action {
      "wip"    => IssueStatus::InProgress,
      "done"   => IssueStatus::Resolved,
      "reopen" => IssueStatus::Flagged,
      _ => return,
    };

    let (registry, status_tx) = {
      let data = ctx.data.read().await;
      (
        data.get::<AlertRegistryKey>().cloned(),
        data.get::<StatusBroadcastKey>().cloned(),
      )
    };

    let Some(registry) = registry else {
      log::warn!("[ArenaLink Bot] AlertRegistry not found in TypeMap");
      return;
    };

    let actor = component.user.name.clone();
    let msg_id = component.message.id;

    let updated_alert = {
      let mut state = registry.lock().await;

      let updated = state.update_status(msg_id, new_status, Some(actor.clone()));

      // Broadcast new team status after mutation.
      if let Some(ref alert) = updated {
        if let Some(tid) = alert.team_id {
          let team_status = state.team_status(tid as u32);
          let open_count = state.team_open_count(tid as u32);
          if let Some(tx) = &status_tx {
            let _ = tx.send(TeamStatusUpdate {
              team_id: tid as u32,
              status: team_status,
              open_count,
            });
          }
        }
      }

      updated
    };

    // Persist status change to database.
    if updated_alert.is_some() {
      if let Err(e) = AlertRepository::update_status(
        msg_id.get(),
        &format!("{new_status:?}"),
        Some(&actor),
      ) {
        log::warn!("[Bot] Failed to update alert {msg_id} in database: {e}");
      }
    } else {
      log::warn!("[Bot] No in-memory alert for message {msg_id} — attempting DB recovery");
      // Alert missing from memory (e.g. brief restart). Try to patch DB status
      // directly so at least the persistent record is correct.
      if let Err(e) = AlertRepository::update_status(
        msg_id.get(),
        &format!("{new_status:?}"),
        Some(&actor),
      ) {
        log::warn!("[Bot] DB update also failed for message {msg_id}: {e}");
      }
    }

    match updated_alert {
      Some(alert) => {
        let response = CreateInteractionResponse::UpdateMessage(build_interaction_update(&alert));
        if let Err(e) = component.create_response(&ctx.http, response).await {
          log::error!("[ArenaLink Bot] Failed to update message for station {station}: {e}");
        } else {
          log::info!(
            "[ArenaLink Bot] Station {station} alert → {:?} (by {})",
            new_status,
            component.user.name
          );
        }
      }
      None => {
        use serenity::builder::CreateInteractionResponseMessage;
        let response = CreateInteractionResponse::Message(
          CreateInteractionResponseMessage::new()
            .content(
              "⚠️ This alert is no longer tracked (bot was restarted). \
               Please file a new alert if the issue is still ongoing.",
            )
            .ephemeral(true),
        );
        let _ = component.create_response(&ctx.http, response).await;
      }
    }
  }
}

// ─── Alert state recovery ─────────────────────────────────────────────────────
//
// On bot `ready`, rebuild the in-memory AlertState so button interactions work
// immediately after a restart.
//
// Strategy:
//   1. Try the database first — fast, complete, preserves all fields.
//   2. If the database is empty (first run or cleared), fall back to scanning
//      Discord channel history and import what we find into the database.

async fn recover_alert_state(
  ctx: &Context,
  channel_id: ChannelId,
  bot_id: UserId,
  registry: &AlertRegistry,
  status_tx: Option<&StatusBroadcast>,
) {
  // ── 1. Database recovery ────────────────────────────────────────────────────
  match AlertRepository::get_all() {
    Ok(records) if !records.is_empty() => {
      let count = records.len();
      let mut state = registry.lock().await;
      for (key, record) in records {
        if let Ok(msg_id_u64) = key.parse::<u64>() {
          state.insert(MessageId::new(msg_id_u64), from_db_record(record));
        }
      }
      drop(state);
      log::info!("[Bot] Loaded {count} alerts from database");
      broadcast_statuses(registry, status_tx).await;
      return;
    }
    Ok(_) => log::info!("[Bot] Database empty — scanning Discord channel history…"),
    Err(e) => log::warn!("[Bot] Database load failed ({e}) — scanning Discord channel history…"),
  }

  // ── 2. Discord channel scan fallback (imports into DB for next restart) ─────
  let mut total = 0u32;
  let mut before: Option<MessageId> = None;

  loop {
    let mut builder = GetMessages::new().limit(100);
    if let Some(b) = before {
      builder = builder.before(b);
    }

    let batch = match channel_id.messages(&ctx.http, builder).await {
      Ok(m) if m.is_empty() => break,
      Ok(m) => m,
      Err(e) => {
        log::warn!("[Bot] Recovery: failed to fetch messages — {e}");
        break;
      }
    };

    let fetched = batch.len();
    before = batch.last().map(|m| m.id);

    for msg in batch {
      if msg.author.id != bot_id { continue; }
      if msg.embeds.is_empty() || msg.components.is_empty() { continue; }

      let embed = &msg.embeds[0];
      let Some(ref title) = embed.title else { continue };

      let Some(team_id) = parse_team_id_from_title(title) else { continue };

      // Station: prefer dedicated field (new format), fall back to title brackets (old format).
      let station = embed.fields.iter()
        .find(|f| f.name == "Station")
        .map(|f| f.value.clone())
        .or_else(|| parse_station_from_title(title))
        .unwrap_or_default();
      if station.is_empty() { continue; }

      let status = status_from_components(&msg.components);
      let alert_type = embed.fields.iter()
        .find(|f| f.name == "Issue")
        .and_then(|f| alert_type_from_field(&f.value))
        .unwrap_or(PitAlertType::Custom);
      let sub_issues = embed.fields.iter()
        .find(|f| f.name == "Specific Issues")
        .map(|f| {
          f.value.lines()
            .map(|l| l.trim_start_matches("• ").to_string())
            .filter(|l| !l.is_empty())
            .collect::<Vec<_>>()
        })
        .unwrap_or_default();
      let field_notes = embed.fields.iter()
        .find(|f| f.name == "📝 Field Notes")
        .map(|f| f.value.clone());
      let (match_name, match_state_label) = embed.fields.iter()
        .find(|f| f.name.contains("Match Context"))
        .map(|f| parse_match_context_field(&f.value))
        .unwrap_or_default();
      let pit_map_url = embed.url.clone();

      let alert = PitAlert {
        team_id: Some(team_id as i32),
        team_name: None,
        station,
        match_ctx: MatchContext {
          match_name,
          match_type_label: String::new(),
          match_state_label,
          time_remaining_sec: None,
          scheduled_start: None,
        },
        alert_type,
        sub_issues,
        recipients: vec![],
        mention_text: String::new(),
        field_notes,
        status,
        action_by: None,
        pit_map_url,
      };

      // Import into database so future restarts don't need the channel scan.
      if let Err(e) = AlertRepository::save(msg.id.get(), &to_db_record(&alert)) {
        log::warn!("[Bot] Failed to import alert {} into database: {e}", msg.id);
      }

      let mut state = registry.lock().await;
      state.insert(msg.id, alert);
      drop(state);
      total += 1;
    }

    if fetched < 100 || total >= 500 { break; }
  }

  log::info!("[Bot] Discord scan complete — {total} alerts imported");
  broadcast_statuses(registry, status_tx).await;
}

/// Push current team statuses to any already-connected WebSocket clients.
async fn broadcast_statuses(registry: &AlertRegistry, status_tx: Option<&StatusBroadcast>) {
  if let Some(tx) = status_tx {
    let state = registry.lock().await;
    for team_id in state.all_team_ids() {
      let status = state.team_status(team_id);
      if status == TeamTicketStatus::Clear { continue; }
      let open_count = state.team_open_count(team_id);
      let _ = tx.send(TeamStatusUpdate { team_id, status, open_count });
    }
  }
}

/// Extract the team ID from an embed title.
/// Handles both formats:
///   - New: `"Team 3100"`
///   - Old: `"🚨 Pit Alert — Team 3100 — Name [Red 1]"`
fn parse_team_id_from_title(title: &str) -> Option<u32> {
  let team_pos = title.find("Team ")? + 5;
  let rest = &title[team_pos..];
  let id_end = rest.find(|c: char| !c.is_ascii_digit()).unwrap_or(rest.len());
  if id_end == 0 { return None; }
  rest[..id_end].parse().ok()
}

/// Extract the station from the OLD title format: `"… [Red 1]"`.
/// Returns None for new-format titles (station is in a field instead).
fn parse_station_from_title(title: &str) -> Option<String> {
  let open  = title.rfind('[')? + 1;
  let close = title.rfind(']')?;
  if close <= open { return None; }
  let station = title[open..close].trim().to_string();
  if station.is_empty() { None } else { Some(station) }
}

/// Determine `IssueStatus` from the Discord button set on a recovered message.
///
/// Button presence by status:
/// - Flagged    → \[wip, done\]
/// - InProgress → \[done, reopen\]
/// - Resolved   → \[reopen\]
fn status_from_components(components: &[serenity::model::application::ActionRow]) -> IssueStatus {
  let (mut has_wip, mut has_done, mut has_reopen) = (false, false, false);

  for row in components {
    for comp in &row.components {
      if let ActionRowComponent::Button(btn) = comp {
        if let ButtonKind::NonLink { ref custom_id, .. } = btn.data {
          if custom_id.contains(":wip:")    { has_wip    = true; }
          if custom_id.contains(":done:")   { has_done   = true; }
          if custom_id.contains(":reopen:") { has_reopen = true; }
        }
      }
    }
  }

  if has_wip && has_done         { IssueStatus::Flagged }
  else if has_done && has_reopen { IssueStatus::InProgress }
  else if has_reopen             { IssueStatus::Resolved }
  else                           { IssueStatus::Flagged }
}

/// Parse `PitAlertType` from the embed "Issue" field value.
/// Expected format: `"🔋 **BATTERY** — description"`
fn alert_type_from_field(value: &str) -> Option<PitAlertType> {
  let start = value.find("**")? + 2;
  let rest  = &value[start..];
  let end   = rest.find("**")?;
  Some(PitAlertType::from_label(&rest[..end]))
}

/// Parse `(match_name, match_state_label)` from the "Match Context" embed field.
/// Expected format: `"**Match:** Name\n**Phase:** state"`
fn parse_match_context_field(value: &str) -> (String, String) {
  let name = value.lines()
    .find(|l| l.starts_with("**Match:**"))
    .map(|l| l["**Match:**".len()..].trim().to_string())
    .unwrap_or_default();
  let phase = value.lines()
    .find(|l| l.starts_with("**Phase:**"))
    .map(|l| l["**Phase:**".len()..].trim().to_string())
    .unwrap_or_default();
  (name, phase)
}

// ─── Bot lifecycle ────────────────────────────────────────────────────────────

async fn run_bot(
  token: &str,
  channel_id: u64,
  registry: AlertRegistry,
  status_tx: StatusBroadcast,
  shutdown: &'static ShutdownNotifier,
) -> bool {
  // This bot only posts messages (HTTP) and handles button interactions
  // (interaction_create). Discord delivers interaction_create events with NO
  // privileged intents required — it works with an empty intent set.
  // GUILD_MESSAGES / MESSAGE_CONTENT are privileged intents that need to be
  // manually enabled in the Developer Portal; we don't use them, so don't
  // request them (doing so caused the bot to fail if not explicitly enabled).
  let intents = GatewayIntents::GUILDS;

  let mut client = match Client::builder(token, intents).event_handler(Handler).await {
    Ok(c) => c,
    Err(e) => {
      log::error!("[ArenaLink Bot] Failed to build serenity client: {e}");
      return false;
    }
  };

  {
    let mut data = client.data.write().await;
    data.insert::<AlertRegistryKey>(registry);
    data.insert::<StatusBroadcastKey>(status_tx);
    data.insert::<ChannelIdKey>(ChannelId::new(channel_id));
  }

  let mut post_exit_rx = shutdown.subscribe();

  let shard_manager = client.shard_manager.clone();
  let mut shard_shutdown_rx = shutdown.subscribe();
  tokio::spawn(async move {
    let _ = shard_shutdown_rx.recv().await;
    shard_manager.shutdown_all().await;
  });

  if let Err(e) = client.start().await {
    log::error!("[ArenaLink Bot] Client exited with error: {e}");
  }

  match post_exit_rx.try_recv() {
    Ok(_) | Err(tokio::sync::broadcast::error::TryRecvError::Closed) => {
      log::info!("[ArenaLink Bot] Shutting down gracefully");
      false
    }
    Err(tokio::sync::broadcast::error::TryRecvError::Lagged(_)) => {
      log::info!("[ArenaLink Bot] Shutting down (lagged shutdown signal)");
      false
    }
    Err(tokio::sync::broadcast::error::TryRecvError::Empty) => {
      log::warn!(
        "[ArenaLink Bot] Unexpected disconnect, reconnecting in {}s…",
        RECONNECT_DELAY.as_secs()
      );
      true
    }
  }
}

pub async fn discord_bot_service(
  registry: AlertRegistry,
  status_tx: StatusBroadcast,
  shutdown: &'static ShutdownNotifier,
) {
  let mut shutdown_rx = shutdown.subscribe();

  log::info!("[ArenaLink Bot] Service task started, reading config…");

  let config = DiscordConfig::from_env();

  log::info!(
    "[ArenaLink Bot] Config: enabled={}, token_set={}, channel={}",
    config.enabled,
    !config.bot_token.is_empty(),
    config.pit_alerts_channel_id
  );

  if !config.enabled || config.bot_token.is_empty() {
    log::warn!(
      "[ArenaLink Bot] Discord not enabled or token not set — \
       set DISCORD_BOT_TOKEN and DISCORD_ENABLED=true to start the bot"
    );
    let _ = shutdown_rx.recv().await;
    return;
  }

  log::info!("[ArenaLink Bot] Starting bot service…");

  loop {
    let should_reconnect =
      run_bot(&config.bot_token, config.pit_alerts_channel_id, registry.clone(), status_tx.clone(), shutdown).await;

    if !should_reconnect {
      break;
    }

    tokio::select! {
      _ = tokio::time::sleep(RECONNECT_DELAY) => {}
      _ = shutdown_rx.recv() => break,
    }
  }
}
