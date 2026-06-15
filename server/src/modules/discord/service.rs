use std::time::Duration;

use serenity::{http::Http, model::id::ChannelId};

use database::AlertRepository;

use crate::{config::DiscordConfig, core::scheduler::ScheduledService};

use super::{
  messages::build_initial_message,
  to_db_record,
  types::{AlertRegistry, PitAlert, StatusBroadcast, TeamStatusUpdate},
};

// ─── Discord notification service ─────────────────────────────────────────────

#[derive(Default)]
pub struct DiscordNotificationService;

impl DiscordNotificationService {
  pub fn new() -> Self {
    Self
  }
}

impl ScheduledService for DiscordNotificationService {
  fn interval(&self) -> Duration {
    Duration::from_secs(60)
  }

  fn name(&self) -> &'static str {
    "DiscordNotificationService"
  }

  fn execute(&self) -> anyhow::Result<()> {
    Ok(())
  }
}

// ─── Post a pit alert ─────────────────────────────────────────────────────────

/// Post a new pit alert to Discord, register it in the alert registry, and
/// broadcast the new team status to all connected WebSocket clients.
pub async fn post_pit_alert(
  config: &DiscordConfig,
  registry: &AlertRegistry,
  status_tx: &StatusBroadcast,
  alert: PitAlert,
) -> anyhow::Result<()> {
  if !config.enabled || config.bot_token.is_empty() {
    anyhow::bail!("Discord is not enabled or bot token is not configured");
  }
  if config.pit_alerts_channel_id == 0 {
    anyhow::bail!("DISCORD_PIT_ALERTS_CHANNEL_ID is not set");
  }

  let http = Http::new(&config.bot_token);
  let channel = ChannelId::new(config.pit_alerts_channel_id);

  let message = build_initial_message(&alert);

  let sent = channel.send_message(&http, message).await.map_err(|e| {
    anyhow::anyhow!(
      "Failed to post pit alert to Discord channel {}: {e}",
      config.pit_alerts_channel_id
    )
  })?;

  log::info!(
    "[DiscordNotificationService] Posted pit alert for station {} (msg {})",
    alert.station,
    sent.id
  );

  // Persist to database so alerts survive bot restarts.
  if let Err(e) = AlertRepository::save(sent.id.get(), &to_db_record(&alert)) {
    log::warn!("[Discord] Failed to persist alert to database: {e}");
  }

  let team_id = alert.team_id;
  let mut state = registry.lock().await;
  state.insert(sent.id, alert);

  // Broadcast updated team status to all WS clients.
  if let Some(tid) = team_id {
    let new_status = state.team_status(tid as u32);
    let open_count = state.team_open_count(tid as u32);
    let _ = status_tx.send(TeamStatusUpdate { team_id: tid as u32, status: new_status, open_count });
  }

  Ok(())
}
