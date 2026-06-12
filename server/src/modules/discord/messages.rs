// ─── Discord message builders ─────────────────────────────────────────────────
//
// Builds serenity CreateMessage / EditMessage / CreateInteractionResponseMessage
// objects for pit alerts.
//
// ── Components V2 upgrade path ────────────────────────────────────────────────
// Discord's "Components V2" API (message flag IS_COMPONENTS_V2 = 32768, 2025)
// allows top-level layout components — Container, Section, TextDisplay,
// Separator, Thumbnail, MediaGallery — that fully replace embeds.
//
// When serenity adds stable support, migrate build_embed() + build_action_row()
// into a single Container component tree:
//
//   CreateContainer::new()
//     .add(CreateSection::new()
//       .text(CreateTextDisplay::new(title))
//       .accessory(CreateThumbnail::new(team_avatar_url)))
//     .add(CreateSeparator::new())
//     .add(CreateTextDisplay::new(stats_markdown))
//     .add(CreateActionRow::Buttons(vec![...]))
//
// Set `CreateMessage::flags(MessageFlags::IS_COMPONENTS_V2)` to enable.
// The `content` field (for role pings) still works alongside components v2.
//
// Until then, the embed + action row approach below is production-ready and
// fully supported in serenity 0.12.

use serenity::builder::{
  CreateActionRow, CreateButton, CreateEmbed, CreateEmbedFooter,
  CreateInteractionResponseMessage, CreateMessage, EditMessage,
};
use serenity::model::application::ButtonStyle;
use serenity::model::channel::ReactionType;

use super::types::{IssueStatus, PitAlert};

// ─── Component ID helpers ─────────────────────────────────────────────────────
// Scheme: "pit_alert:{action}:{station}"
// The station is embedded so interaction logs are human-readable.

pub fn wip_id(station: &str) -> String {
  format!("pit_alert:wip:{station}")
}
pub fn done_id(station: &str) -> String {
  format!("pit_alert:done:{station}")
}
pub fn reopen_id(station: &str) -> String {
  format!("pit_alert:reopen:{station}")
}

/// Parse a button custom_id back to (action, station).
/// Returns None for any IDs that don't belong to this bot.
pub fn parse_component_id(id: &str) -> Option<(&str, &str)> {
  let mut parts = id.splitn(3, ':');
  let ns = parts.next()?;
  if ns != "pit_alert" {
    return None;
  }
  let action = parts.next()?;
  let station = parts.next()?;
  Some((action, station))
}

// ─── Embed builder ────────────────────────────────────────────────────────────

/// Construct the rich embed for a pit alert.
/// Called for both initial posts and status-update edits.
pub fn build_embed(alert: &PitAlert) -> CreateEmbed {
  let team_str = match (alert.team_id, &alert.team_name) {
    (Some(id), Some(name)) => format!("Team {id} — {name}"),
    (Some(id), None) => format!("Team {id}"),
    _ => "Unknown Team".to_string(),
  };

  let title_full = format!(
    "{} Pit Alert — {} [{}]",
    alert.status.emoji(),
    team_str,
    alert.station,
  );
  // Discord embed title limit is 256 characters.
  let title = if title_full.chars().count() > 256 {
    let truncated: String = title_full.chars().take(254).collect();
    format!("{truncated}…")
  } else {
    title_full
  };

  let mut embed = CreateEmbed::new()
    .title(title)
    .color(alert.status.color())
    // ── Issue summary ──────────────────────────────────────────────────────
    .field(
      "Issue",
      format!(
        "{} **{}** — {}",
        alert.alert_type.emoji(),
        alert.alert_type.label(),
        alert.alert_type.description()
      ),
      false,
    )
    .field("Category", alert.alert_type.group_label(), true)
    .field(
      "Status",
      match &alert.action_by {
        Some(user) => format!(
          "{} {} — {} by **{}**",
          alert.status.emoji(),
          alert.status.label(),
          match alert.status {
            IssueStatus::InProgress => "assigned",
            IssueStatus::Resolved   => "resolved",
            IssueStatus::Flagged    => "reopened",
          },
          user,
        ),
        None => format!("{} {}", alert.status.emoji(), alert.status.label()),
      },
      true,
    )
    .field("Station", &alert.station, true);

  // ── Sub-issues ─────────────────────────────────────────────────────────────
  if !alert.sub_issues.is_empty() {
    let list = alert.sub_issues.iter().map(|s| format!("• {s}")).collect::<Vec<_>>().join("\n");
    embed = embed.field("Specific Issues", list, false);
  }

  // ── Match context ──────────────────────────────────────────────────────────
  {
    let ctx = &alert.match_ctx;

    let timing = match ctx.time_remaining_sec {
      Some(sec) if sec > 0 => format!("**{sec}s remaining** in {}", ctx.match_state_label),
      Some(_) => format!("{} — period ended", ctx.match_state_label),
      None => ctx.match_state_label.clone(),
    };

    let match_label = if ctx.match_type_label.is_empty() {
      ctx.match_name.clone()
    } else {
      format!("{} ({})", ctx.match_name, ctx.match_type_label)
    };

    let mut match_lines = vec![
      format!("**Match:** {match_label}"),
      format!("**Phase:** {timing}"),
    ];

    if let Some(ref sched) = ctx.scheduled_start {
      match_lines.push(format!("**Scheduled:** {sched}"));
    }

    embed = embed.field("📋 Match Context", match_lines.join("\n"), false);
  }

  // ── Recipients ─────────────────────────────────────────────────────────────
  if !alert.recipients.is_empty() {
    let list = alert.recipients.iter().map(|r| r.label()).collect::<Vec<_>>().join(", ");
    embed = embed.field("Notified", list, false);
  }

  // ── Field notes ────────────────────────────────────────────────────────────
  if let Some(notes) = &alert.field_notes {
    if !notes.is_empty() {
      embed = embed.field("📝 Field Notes", notes.as_str(), false);
    }
  }

  embed.footer(CreateEmbedFooter::new("ArenaLink Pit Alerts"))
}

// ─── Action row builder ───────────────────────────────────────────────────────
// Buttons are dynamic per status — only valid transitions are shown.
//
// Flagged    → [🔧 Working on it] [✅ Resolved]
// InProgress → [✅ Resolved] [🔄 Reopen]
// Resolved   → [🔄 Reopen]

pub fn build_action_row(alert: &PitAlert) -> CreateActionRow {
  let s = &alert.station;

  let buttons: Vec<CreateButton> = match alert.status {
    IssueStatus::Flagged => vec![
      CreateButton::new(wip_id(s))
        .label("Working on it")
        .emoji(ReactionType::Unicode("🔧".to_string()))
        .style(ButtonStyle::Primary),
      CreateButton::new(done_id(s))
        .label("Resolved")
        .emoji(ReactionType::Unicode("✅".to_string()))
        .style(ButtonStyle::Success),
    ],
    IssueStatus::InProgress => vec![
      CreateButton::new(done_id(s))
        .label("Resolved")
        .emoji(ReactionType::Unicode("✅".to_string()))
        .style(ButtonStyle::Success),
      CreateButton::new(reopen_id(s))
        .label("Reopen")
        .emoji(ReactionType::Unicode("🔄".to_string()))
        .style(ButtonStyle::Danger),
    ],
    IssueStatus::Resolved => vec![
      CreateButton::new(reopen_id(s))
        .label("Reopen")
        .emoji(ReactionType::Unicode("🔄".to_string()))
        .style(ButtonStyle::Secondary),
    ],
  };

  CreateActionRow::Buttons(buttons)
}

// ─── Message constructors ─────────────────────────────────────────────────────

/// Build the initial Discord message for a new pit alert.
/// The `content` field carries role pings so they actually notify people
/// (pings inside embeds don't trigger notifications).
pub fn build_initial_message(alert: &PitAlert) -> CreateMessage {
  let content = if alert.mention_text.is_empty() {
    String::new()
  } else {
    format!("{} — new pit alert filed", alert.mention_text)
  };

  CreateMessage::new()
    .content(content)
    .embed(build_embed(alert))
    .components(vec![build_action_row(alert)])
}

/// Build an edit payload after a status change (interaction button click).
/// Used when the server directly edits a message (e.g., from the HTTP API handler).
#[allow(dead_code)]
pub fn build_update_edit(alert: &PitAlert) -> EditMessage {
  EditMessage::new()
    .embed(build_embed(alert))
    .components(vec![build_action_row(alert)])
}

/// Build an interaction response that updates the original message in place.
/// Used in `interaction_create` to respond to button clicks without
/// an extra round-trip.
pub fn build_interaction_update(alert: &PitAlert) -> CreateInteractionResponseMessage {
  CreateInteractionResponseMessage::new()
    .embed(build_embed(alert))
    .components(vec![build_action_row(alert)])
}
