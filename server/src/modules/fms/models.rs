// ─── Generic arena state models ───────────────────────────────────────────────
//
// These are the types sent to Flutter clients over the /ws WebSocket.
// They are intentionally FMS-agnostic — each FMS connector translates its
// wire format into these types. Field names use camelCase in JSON so the
// Flutter client can parse them directly without any mapping.

use std::collections::HashMap;

use serde::{Deserialize, Serialize};

// ─── DS / radio link ─────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct DsLink {
  pub ds_linked:      bool,
  pub rio_linked:     bool,
  pub code_running:   bool,
  pub radio_linked:   bool,
  pub battery_voltage: f64,
  pub trip_time_ms:   i32,
  pub missed_packets: i32,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct RadioLink {
  pub linked:               bool,
  pub bandwidth:            f64,
  pub signal_noise_ratio:   f64,
  pub connection_quality:   i32,
}

// ─── Station status ───────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct StationStatus {
  pub team_id:       Option<u32>,
  pub team_name:     Option<String>,
  pub team_nickname: Option<String>,
  pub ethernet:      bool,
  pub e_stop:        bool,
  pub a_stop:        bool,
  pub bypass:        bool,
  pub ds_link:       Option<DsLink>,
  pub radio_link:    RadioLink,
  pub game_data:     Option<String>,
}

// ─── Hardware / scoring ───────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct ScoringPosition {
  pub ready:           bool,
  pub num_panels:      i32,
  pub num_panels_ready: i32,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct HardwareState {
  pub plc_healthy:          bool,
  pub plc_e_stop:           bool,
  pub access_point_status:  Option<String>,
  pub switch_status:        Option<String>,
  pub red_scc_status:       Option<String>,
  pub blue_scc_status:      Option<String>,
  pub armor_blocks:         HashMap<String, bool>,
  pub referee_ready:        bool,
  pub scoring_positions:    HashMap<String, ScoringPosition>,
}

// ─── Match timer ──────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct MatchPeriodTimer {
  pub period_label:    String,
  pub countdown_sec:   Option<i32>,
  pub period_total_sec: Option<i32>,
}

// ─── Field state ──────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FieldState {
  pub match_id:       i32,
  pub match_name:     String,
  pub match_type:     i32, // 0=test 1=practice 2=qual 3=playoff
  pub scheduled_start: Option<String>,
  pub match_state:    i32,
  pub can_start_match: bool,
  pub match_time_sec: i32,
  pub timer:          MatchPeriodTimer,
  pub stations:       HashMap<String, StationStatus>,
  pub hardware:       HardwareState,
  pub red_score:      Option<i32>,
  pub blue_score:     Option<i32>,
  pub cycle_time:     String,
  pub schedule_offset: String,
  pub display_mode:   Option<String>,
}

impl Default for FieldState {
  fn default() -> Self {
    Self {
      match_id: 0,
      match_name: String::new(),
      match_type: 1,
      scheduled_start: None,
      match_state: 0,
      can_start_match: false,
      match_time_sec: 0,
      timer: MatchPeriodTimer::default(),
      stations: HashMap::new(),
      hardware: HardwareState::default(),
      red_score: None,
      blue_score: None,
      cycle_time: String::new(),
      schedule_offset: String::new(),
      display_mode: None,
    }
  }
}

// ─── Team info ────────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct TeamInfo {
  pub id:          u32,
  pub name:        String,
  pub nickname:    String,
  pub city:        String,
  pub state_prov:  String,
  pub country:     String,
  pub yellow_card: bool,
  pub rank:        Option<i32>,
}

impl TeamInfo {
  pub fn stub(id: u32) -> Self {
    Self {
      id,
      name:        id.to_string(),
      nickname:    String::new(),
      city:        String::new(),
      state_prov:  String::new(),
      country:     String::new(),
      yellow_card: false,
      rank:        None,
    }
  }
}

// ─── Match record ─────────────────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(rename_all = "camelCase")]
pub enum MatchResult {
  NotPlayed,
  RedWon,
  BlueWon,
  Tie,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct MatchRecord {
  pub id:         i32,
  pub name:       String,
  pub played_at:  Option<String>,
  pub red_teams:  Vec<Option<u32>>,
  pub blue_teams: Vec<Option<u32>>,
  pub red_score:  Option<i32>,
  pub blue_score: Option<i32>,
  pub result:     MatchResult,
}

// ─── Top-level arena state ────────────────────────────────────────────────────
//
// This is broadcast to all connected Flutter clients on every change.

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct ArenaState {
  /// Whether the ArenaLink server is connected to the FMS.
  /// Flutter uses this to distinguish "server down" from "FMS down".
  pub fms_connected: bool,
  pub field:         Option<FieldState>,
  pub teams:         Vec<TeamInfo>,
  pub match_log:     Vec<MatchRecord>,
}

// ─── Match log entry ──────────────────────────────────────────────────────────
//
// One tick of per-robot telemetry from a match log. Field names are
// FMS-agnostic — each backend translates its own format into these types.

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct MatchLogEntry {
  pub match_time_sec:  f64,
  pub auto:            bool,
  pub enabled:         bool,
  pub ds_auto:         bool,
  pub ds_enabled:      bool,
  pub battery_voltage: f64,
  pub rx_rate_mbps:    f64,
  pub tx_rate_mbps:    f64,
  pub missed_packets:  i32,
  pub ds_linked:       bool,
  pub radio_linked:    bool,
  pub rio_linked:      bool,
  pub robot_linked:    bool,
  pub ethernet_linked: bool,
}

// ─── Broadcast channel types ──────────────────────────────────────────────────

pub type ArenaBroadcast = tokio::sync::broadcast::Sender<ArenaState>;

pub fn new_arena_broadcast() -> ArenaBroadcast {
  tokio::sync::broadcast::channel(64).0
}
