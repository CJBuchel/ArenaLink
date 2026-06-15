use std::{collections::HashMap, fmt, sync::Arc};

use serde::{Deserialize, Serialize};
use serenity::model::id::MessageId;
use tokio::sync::{Mutex, broadcast};

// ─── Alert type ───────────────────────────────────────────────────────────────

/// All possible issue categories a field operator can file.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum PitAlertType {
  // ── Robot / Electronics ────────────────────────────────────────────────────
  Battery,
  Rio,
  Code,
  Radio,
  NoDs,
  EStop,
  // ── Inspection / Mechanical ────────────────────────────────────────────────
  Mechanical,
  Reinspect,
  Electrical,
  // ── Support ───────────────────────────────────────────────────────────────
  Csa,
  Inspector,
  // ── General ───────────────────────────────────────────────────────────────
  Custom,
}

impl PitAlertType {
  pub fn label(&self) -> &'static str {
    match self {
      PitAlertType::Battery    => "BATTERY",
      PitAlertType::Rio        => "RIO",
      PitAlertType::Code       => "CODE",
      PitAlertType::Radio      => "RADIO",
      PitAlertType::NoDs       => "NO DS",
      PitAlertType::EStop      => "E-STOP",
      PitAlertType::Mechanical => "MECHANICAL",
      PitAlertType::Reinspect  => "REINSPECT",
      PitAlertType::Electrical => "ELECTRICAL",
      PitAlertType::Csa        => "CSA",
      PitAlertType::Inspector  => "INSPECTOR",
      PitAlertType::Custom     => "CUSTOM",
    }
  }

  pub fn emoji(&self) -> &'static str {
    match self {
      PitAlertType::Battery    => "🔋",
      PitAlertType::Rio        => "🖥️",
      PitAlertType::Code       => "💻",
      PitAlertType::Radio      => "📡",
      PitAlertType::NoDs       => "🖱️",
      PitAlertType::EStop      => "🛑",
      PitAlertType::Mechanical => "🔩",
      PitAlertType::Reinspect  => "⚖️",
      PitAlertType::Electrical => "⚡",
      PitAlertType::Csa        => "👷",
      PitAlertType::Inspector  => "🔍",
      PitAlertType::Custom     => "📋",
    }
  }

  pub fn description(&self) -> &'static str {
    match self {
      PitAlertType::Battery    => "Battery voltage issue detected",
      PitAlertType::Rio        => "RoboRIO not connecting or unresponsive",
      PitAlertType::Code       => "Robot code not running or crashed",
      PitAlertType::Radio      => "Radio not linking to access point",
      PitAlertType::NoDs       => "Driver Station not connecting to robot",
      PitAlertType::EStop      => "Emergency stop was triggered on field",
      PitAlertType::Mechanical => "Mechanical damage or modification detected",
      PitAlertType::Reinspect  => "Robot needs to be reinspected",
      PitAlertType::Electrical => "Electrical wiring issue",
      PitAlertType::Csa        => "Control System Advisor assistance needed",
      PitAlertType::Inspector  => "Robot Inspector assistance needed",
      PitAlertType::Custom     => "Custom field note",
    }
  }

  pub fn group_label(&self) -> &'static str {
    match self {
      PitAlertType::Battery
      | PitAlertType::Rio
      | PitAlertType::Code
      | PitAlertType::Radio
      | PitAlertType::NoDs
      | PitAlertType::EStop => "Robot / Electronics",
      PitAlertType::Mechanical
      | PitAlertType::Reinspect
      | PitAlertType::Electrical => "Inspection / Mechanical",
      PitAlertType::Csa | PitAlertType::Inspector => "Support",
      PitAlertType::Custom => "General",
    }
  }

  /// Parse from the uppercase label used in Discord embeds (e.g. "BATTERY").
  pub fn from_label(s: &str) -> Self {
    match s {
      "BATTERY"    => PitAlertType::Battery,
      "RIO"        => PitAlertType::Rio,
      "CODE"       => PitAlertType::Code,
      "RADIO"      => PitAlertType::Radio,
      "NO DS"      => PitAlertType::NoDs,
      "E-STOP"     => PitAlertType::EStop,
      "MECHANICAL" => PitAlertType::Mechanical,
      "REINSPECT"  => PitAlertType::Reinspect,
      "ELECTRICAL" => PitAlertType::Electrical,
      "CSA"        => PitAlertType::Csa,
      "INSPECTOR"  => PitAlertType::Inspector,
      _            => PitAlertType::Custom,
    }
  }

  /// Parse from the string sent by the Flutter client.
  pub fn from_str(s: &str) -> Option<Self> {
    match s {
      "battery"    | "Battery"    => Some(PitAlertType::Battery),
      "rio"        | "Rio"        => Some(PitAlertType::Rio),
      "code"       | "Code"       => Some(PitAlertType::Code),
      "radio"      | "Radio"      => Some(PitAlertType::Radio),
      "noDs"       | "NoDs"       => Some(PitAlertType::NoDs),
      "eStop"      | "EStop"      => Some(PitAlertType::EStop),
      "mechanical" | "Mechanical" => Some(PitAlertType::Mechanical),
      "reinspect"  | "Reinspect"  => Some(PitAlertType::Reinspect),
      "electrical" | "Electrical" => Some(PitAlertType::Electrical),
      "csa"        | "Csa"        => Some(PitAlertType::Csa),
      "inspector"  | "Inspector"  => Some(PitAlertType::Inspector),
      "custom"     | "Custom"     => Some(PitAlertType::Custom),
      _ => None,
    }
  }
}

impl fmt::Display for PitAlertType {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "{} {}", self.emoji(), self.label())
  }
}

// ─── Recipient ────────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum AlertRecipient {
  Fta,
  Ftaa,
  Csa,
  Inspector,
  Referee,
  Lri,
}

impl AlertRecipient {
  pub fn label(&self) -> &'static str {
    match self {
      AlertRecipient::Fta       => "FTA",
      AlertRecipient::Ftaa      => "FTAA",
      AlertRecipient::Csa       => "CSA",
      AlertRecipient::Inspector => "Inspector",
      AlertRecipient::Referee   => "Referee",
      AlertRecipient::Lri       => "LRI",
    }
  }

  pub fn from_str(s: &str) -> Option<Self> {
    match s {
      "fta"       | "Fta"       => Some(AlertRecipient::Fta),
      "ftaa"      | "Ftaa"      => Some(AlertRecipient::Ftaa),
      "csa"       | "Csa"       => Some(AlertRecipient::Csa),
      "inspector" | "Inspector" => Some(AlertRecipient::Inspector),
      "referee"   | "Referee"   => Some(AlertRecipient::Referee),
      "lri"       | "Lri"       => Some(AlertRecipient::Lri),
      _ => None,
    }
  }
}

// ─── Issue status ─────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum IssueStatus {
  Flagged,
  InProgress,
  Resolved,
}

impl IssueStatus {
  pub fn label(&self) -> &'static str {
    match self {
      IssueStatus::Flagged    => "FLAGGED",
      IssueStatus::InProgress => "IN PROGRESS",
      IssueStatus::Resolved   => "RESOLVED",
    }
  }

  pub fn emoji(&self) -> &'static str {
    match self {
      IssueStatus::Flagged    => "🚨",
      IssueStatus::InProgress => "🔧",
      IssueStatus::Resolved   => "✅",
    }
  }

  pub fn color(&self) -> u32 {
    match self {
      IssueStatus::Flagged    => 0xEF9F27, // amber
      IssueStatus::InProgress => 0x378ADD, // blue
      IssueStatus::Resolved   => 0x6B7280, // grey
    }
  }
}

// ─── Match context ────────────────────────────────────────────────────────────

#[derive(Debug, Clone)]
pub struct MatchContext {
  pub match_name: String,
  pub match_type_label: String,
  pub match_state_label: String,
  pub time_remaining_sec: Option<i32>,
  pub scheduled_start: Option<String>,
}

// ─── Pit alert ────────────────────────────────────────────────────────────────

#[derive(Debug, Clone)]
pub struct PitAlert {
  pub team_id: Option<i32>,
  pub team_name: Option<String>,
  pub station: String,
  pub match_ctx: MatchContext,
  pub alert_type: PitAlertType,
  /// Specific problem descriptors selected by the operator.
  pub sub_issues: Vec<String>,
  pub recipients: Vec<AlertRecipient>,
  pub mention_text: String,
  pub field_notes: Option<String>,
  pub status: IssueStatus,
  /// Discord username of the person who last changed the status (WIP / Resolved).
  pub action_by: Option<String>,
  /// Nexus pit map URL for this team, if NEXUS_EVENT_ID is configured.
  pub pit_map_url: Option<String>,
}

// ─── Team ticket status ───────────────────────────────────────────────────────

/// Aggregate ticket status for one team — computed from all their open alerts.
///
/// Priority (highest → lowest): Flagged > InProgress > AllResolved > Clear.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum TeamTicketStatus {
  Clear,       // no tickets filed for this team
  Flagged,     // ≥1 alert still in Flagged state
  InProgress,  // none Flagged, ≥1 InProgress
  AllResolved, // all alerts Resolved
}

/// Push message sent to WebSocket clients when any team's status changes.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TeamStatusUpdate {
  pub team_id: u32,
  pub status: TeamTicketStatus,
  /// Number of alerts that are not yet Resolved (Flagged + InProgress).
  pub open_count: u32,
}

// ─── Alert summary (REST history endpoint) ────────────────────────────────────

/// Lightweight summary of a single alert — returned by GET /api/alerts/history/{team_id}.
#[derive(Debug, Clone, Serialize)]
pub struct AlertSummary {
  pub alert_type: String,
  pub sub_issues: Vec<String>,
  pub status: IssueStatus,
  pub action_by: Option<String>,
  pub station: String,
  pub match_name: String,
  pub match_state_label: String,
  pub field_notes: Option<String>,
}

/// Broadcast channel for real-time status pushes to the field monitor.
pub type StatusBroadcast = broadcast::Sender<TeamStatusUpdate>;

pub fn new_status_broadcast() -> StatusBroadcast {
  broadcast::channel(64).0
}

// ─── Alert state ──────────────────────────────────────────────────────────────

/// In-memory store for live pit alerts.
///
/// Two indices:
/// - `by_message`: MessageId → PitAlert — used by the Discord bot to handle
///   button interactions and update status in place.
/// - `by_team`: team_id → Vec<MessageId> — used by the REST/WS API to answer
///   "what is the current ticket status for team X?"
///
/// No persistence — if the server restarts, the Discord channel has the full
/// history. The field monitor reconnects and starts from a clean slate.
pub struct AlertState {
  by_message: HashMap<MessageId, PitAlert>,
  by_team: HashMap<u32, Vec<MessageId>>,
}

impl AlertState {
  pub fn new() -> Self {
    Self { by_message: HashMap::new(), by_team: HashMap::new() }
  }

  /// Insert a newly posted alert.
  pub fn insert(&mut self, msg_id: MessageId, alert: PitAlert) {
    if let Some(team_id) = alert.team_id {
      self.by_team.entry(team_id as u32).or_default().push(msg_id);
    }
    self.by_message.insert(msg_id, alert);
  }

  /// Update the status of an existing alert (called from Discord button handler).
  /// `action_by` is the Discord display name of the user who clicked the button.
  /// Returns the updated alert (cloned) for broadcasting.
  pub fn update_status(
    &mut self,
    msg_id: MessageId,
    status: IssueStatus,
    action_by: Option<String>,
  ) -> Option<PitAlert> {
    let alert = self.by_message.get_mut(&msg_id)?;
    alert.status = status;
    alert.action_by = action_by;
    Some(alert.clone())
  }

  /// Get an alert by message ID (for building the Discord interaction response).
  pub fn get(&self, msg_id: &MessageId) -> Option<&PitAlert> {
    self.by_message.get(msg_id)
  }

  /// All team IDs that have at least one alert.
  pub fn all_team_ids(&self) -> Vec<u32> {
    self.by_team.keys().copied().collect()
  }

  /// Count alerts that are not yet Resolved for a team.
  pub fn team_open_count(&self, team_id: u32) -> u32 {
    let msg_ids = match self.by_team.get(&team_id) {
      Some(ids) if !ids.is_empty() => ids,
      _ => return 0,
    };
    msg_ids.iter()
      .filter(|id| {
        self.by_message.get(*id).map_or(false, |a| a.status != IssueStatus::Resolved)
      })
      .count() as u32
  }

  /// Return a summary of every alert filed for a team (newest last).
  pub fn team_alerts(&self, team_id: u32) -> Vec<AlertSummary> {
    let msg_ids = match self.by_team.get(&team_id) {
      Some(ids) => ids,
      None => return vec![],
    };
    msg_ids.iter()
      .filter_map(|id| self.by_message.get(id))
      .map(|a| AlertSummary {
        alert_type: format!("{:?}", a.alert_type),
        sub_issues: a.sub_issues.clone(),
        status: a.status,
        action_by: a.action_by.clone(),
        station: a.station.clone(),
        match_name: a.match_ctx.match_name.clone(),
        match_state_label: a.match_ctx.match_state_label.clone(),
        field_notes: a.field_notes.clone(),
      })
      .collect()
  }

  /// Compute the aggregate ticket status for a team.
  pub fn team_status(&self, team_id: u32) -> TeamTicketStatus {
    let msg_ids = match self.by_team.get(&team_id) {
      Some(ids) if !ids.is_empty() => ids,
      _ => return TeamTicketStatus::Clear,
    };

    let mut has_flagged = false;
    let mut has_in_progress = false;
    let mut any_alert = false;

    for msg_id in msg_ids {
      if let Some(alert) = self.by_message.get(msg_id) {
        any_alert = true;
        match alert.status {
          IssueStatus::Flagged    => has_flagged = true,
          IssueStatus::InProgress => has_in_progress = true,
          IssueStatus::Resolved   => {}
        }
      }
    }

    if !any_alert           { TeamTicketStatus::Clear }
    else if has_flagged     { TeamTicketStatus::Flagged }
    else if has_in_progress { TeamTicketStatus::InProgress }
    else                    { TeamTicketStatus::AllResolved }
  }
}

pub type AlertRegistry = Arc<Mutex<AlertState>>;

pub fn new_alert_registry() -> AlertRegistry {
  Arc::new(Mutex::new(AlertState::new()))
}
