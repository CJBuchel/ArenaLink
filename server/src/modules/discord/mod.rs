mod bot;
mod messages;
mod service;
pub mod types;

pub use bot::discord_bot_service;
pub use service::{post_pit_alert, DiscordNotificationService};
pub use types::{
  AlertRecipient, AlertRegistry, AlertSummary, IssueStatus, MatchContext, PitAlert, PitAlertType,
  StatusBroadcast, TeamStatusUpdate, TeamTicketStatus, new_alert_registry, new_status_broadcast,
};

// ─── DB record conversions ────────────────────────────────────────────────────
// Shared between service (write on post) and bot (write on Discord scan import,
// read on startup recovery).

use database::PitAlertRecord;

pub(super) fn to_db_record(alert: &PitAlert) -> PitAlertRecord {
  PitAlertRecord {
    team_id: alert.team_id,
    team_name: alert.team_name.clone(),
    station: alert.station.clone(),
    alert_type: format!("{:?}", alert.alert_type),
    sub_issues: alert.sub_issues.clone(),
    recipients: alert.recipients.iter().map(|r| format!("{:?}", r)).collect(),
    field_notes: alert.field_notes.clone(),
    status: format!("{:?}", alert.status),
    action_by: alert.action_by.clone(),
    match_name: alert.match_ctx.match_name.clone(),
    match_type_label: alert.match_ctx.match_type_label.clone(),
    match_state_label: alert.match_ctx.match_state_label.clone(),
    time_remaining_sec: alert.match_ctx.time_remaining_sec,
    scheduled_start: alert.match_ctx.scheduled_start.clone(),
    pit_map_url: alert.pit_map_url.clone(),
    created_at: std::time::SystemTime::now()
      .duration_since(std::time::UNIX_EPOCH)
      .map(|d| d.as_secs() as i64)
      .unwrap_or(0),
  }
}

pub(super) fn from_db_record(record: PitAlertRecord) -> PitAlert {
  PitAlert {
    team_id: record.team_id,
    team_name: record.team_name,
    station: record.station,
    match_ctx: MatchContext {
      match_name: record.match_name,
      match_type_label: record.match_type_label,
      match_state_label: record.match_state_label,
      time_remaining_sec: record.time_remaining_sec,
      scheduled_start: record.scheduled_start,
    },
    alert_type: PitAlertType::from_str(&record.alert_type).unwrap_or(PitAlertType::Custom),
    sub_issues: record.sub_issues,
    recipients: record.recipients.iter().filter_map(|r| AlertRecipient::from_str(r)).collect(),
    mention_text: String::new(),
    field_notes: record.field_notes,
    status: match record.status.as_str() {
      "InProgress" => IssueStatus::InProgress,
      "Resolved" => IssueStatus::Resolved,
      _ => IssueStatus::Flagged,
    },
    action_by: record.action_by,
    pit_map_url: record.pit_map_url,
  }
}
