use serde::{Deserialize, Serialize};

/// Persistent form of a pit alert, stored in sled as JSON.
///
/// All enum types (alert_type, status, recipients) are stored as their Rust
/// Debug format so they survive code refactors without a migration step.
/// The conversion back to typed values is done in the server crate.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PitAlertRecord {
  pub team_id: Option<i32>,
  pub team_name: Option<String>,

  pub station: String,
  /// Debug name of PitAlertType, e.g. "Battery", "NoDs", "EStop".
  pub alert_type: String,
  pub sub_issues: Vec<String>,
  /// Debug names of AlertRecipient, e.g. ["Fta", "Csa"].
  pub recipients: Vec<String>,
  pub field_notes: Option<String>,

  /// "Flagged", "InProgress", or "Resolved".
  pub status: String,
  pub action_by: Option<String>,

  pub match_name: String,
  pub match_type_label: String,
  pub match_state_label: String,
  pub time_remaining_sec: Option<i32>,
  pub scheduled_start: Option<String>,

  pub pit_map_url: Option<String>,

  /// Unix timestamp (seconds) when the alert was first filed.
  pub created_at: i64,
}
