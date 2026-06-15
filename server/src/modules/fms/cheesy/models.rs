// ─── Cheesy Arena wire-format models ─────────────────────────────────────────
//
// These mirror the Cheesy Arena WebSocket JSON payloads.
// They are internal to the Cheesy Arena connector and must NOT be used by
// any other module — the connector translates these into generic ArenaState.
//
// Source references:
//   field/arena_notifiers.go  — arenaStatus, matchLoad, matchTime, etc.
//   game/match_timing.go      — matchTiming
//   web/api.go                — /api/matches, /api/rankings

use serde::Deserialize;
use std::collections::HashMap;

// ─── WebSocket envelope ───────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
pub struct ArenaMessage {
  #[serde(rename = "type")]
  pub msg_type: String,
  pub data:     serde_json::Value,
}

// ─── arenaStatus ──────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyArenaStatus {
  pub match_id:               i32,
  pub alliance_stations:      HashMap<String, CheesyAllianceStation>,
  pub match_state:            i32,
  pub can_start_match:        bool,
  pub plc_is_healthy:         bool,
  pub field_e_stop:           bool,
  #[serde(default)]
  pub access_point_status:    String,
  #[serde(default)]
  pub switch_status:          String,
  #[serde(rename = "RedSCCStatus", default)]
  pub red_scc_status:         String,
  #[serde(rename = "BlueSCCStatus", default)]
  pub blue_scc_status:        String,
  pub plc_armor_block_statuses: Option<HashMap<String, bool>>,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyAllianceStation {
  pub ds_conn:    Option<CheesyDsConnection>,
  pub ethernet:   bool,
  pub a_stop:     bool,
  pub e_stop:     bool,
  pub bypass:     bool,
  pub team:       Option<CheesyTeam>,
  pub wifi_status: CheesyWifiStatus,
  #[serde(default)]
  pub game_data:  String,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyDsConnection {
  pub ds_linked:          bool,
  #[serde(default)]
  pub rio_linked:         bool,
  pub robot_linked:       bool,
  pub radio_linked:       bool,
  pub battery_voltage:    f64,
  pub ds_robot_trip_time_ms: i32,
  pub missed_packet_count: i32,
}

#[derive(Debug, Deserialize, Default)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyWifiStatus {
  pub team_id:            u32,
  pub radio_linked:       bool,
  #[serde(rename = "MBits", default)]
  pub m_bits:             f64,
  #[serde(default)]
  pub signal_noise_ratio: f64,
  #[serde(default)]
  pub connection_quality: i32,
}

// ─── matchLoad ────────────────────────────────────────────────────────────────

#[derive(Debug)]
pub struct CheesyMatchLoad {
  pub match_:  CheesyMatch,
  pub teams:   HashMap<String, Option<CheesyTeam>>,
}

impl CheesyMatchLoad {
  pub fn from_value(v: serde_json::Value) -> Option<Self> {
    let match_ = serde_json::from_value::<CheesyMatch>(v.get("Match")?.clone()).ok()?;
    let teams: HashMap<String, Option<CheesyTeam>> =
      serde_json::from_value(v.get("Teams")?.clone()).ok()?;
    Some(CheesyMatchLoad { match_, teams })
  }
}

#[derive(Debug, Deserialize, Clone)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyMatch {
  pub id:                   i32,
  #[serde(rename = "Type")]
  pub match_type:           i32,
  #[serde(default)]
  pub long_name:            String,
  #[serde(default)]
  pub short_name:           String,
  #[serde(default)]
  pub red1:                 u32,
  #[serde(default)]
  pub red2:                 u32,
  #[serde(default)]
  pub red3:                 u32,
  #[serde(default)]
  pub blue1:                u32,
  #[serde(default)]
  pub blue2:                u32,
  #[serde(default)]
  pub blue3:                u32,
  #[serde(default)]
  pub status:               i32,
  #[serde(rename = "Time")]
  pub scheduled_start_time: Option<String>,
}

// ─── matchTime ────────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyMatchTime {
  pub match_state:   i32,
  pub match_time_sec: i32,
}

// ─── matchTiming ─────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize, Clone)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyMatchTiming {
  #[serde(default = "default_auto")]
  pub auto_duration_sec:             i32,
  #[serde(default = "default_pause")]
  pub pause_duration_sec:            i32,
  #[serde(default = "default_transition")]
  pub transition_shift_duration_sec: i32,
  #[serde(default = "default_shift")]
  pub shift_duration_sec:            i32,
  #[serde(default = "default_endgame")]
  pub endgame_duration_sec:          i32,
}

fn default_auto() -> i32 { 15 }
fn default_pause() -> i32 { 3 }
fn default_transition() -> i32 { 10 }
fn default_shift() -> i32 { 25 }
fn default_endgame() -> i32 { 30 }

impl Default for CheesyMatchTiming {
  fn default() -> Self {
    Self {
      auto_duration_sec:             15,
      pause_duration_sec:            3,
      transition_shift_duration_sec: 10,
      shift_duration_sec:            25,
      endgame_duration_sec:          30,
    }
  }
}

impl CheesyMatchTiming {
  pub fn teleop_duration_sec(&self) -> i32 {
    self.transition_shift_duration_sec + 4 * self.shift_duration_sec + self.endgame_duration_sec
  }
}

// ─── eventStatus ─────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyEventStatus {
  #[serde(default)]
  pub cycle_time:        String,
  #[serde(default)]
  pub early_late_message: String,
}

// ─── realtimeScore ───────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyRealtimeScore {
  pub red:         CheesyAllianceScore,
  pub blue:        CheesyAllianceScore,
  #[serde(default)]
  pub match_state: i32,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyAllianceScore {
  pub score_summary: CheesyScoreSummary,
}

#[derive(Debug, Deserialize, Default)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyScoreSummary {
  #[serde(default)]
  pub score: i32,
}

// ─── scoringStatus ───────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyScoringStatus {
  #[serde(default)]
  pub referee_score_ready: bool,
  pub position_statuses:   HashMap<String, CheesyPositionStatus>,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyPositionStatus {
  #[serde(default)]
  pub ready:         bool,
  #[serde(default)]
  pub num_panels:    i32,
  #[serde(default)]
  pub num_panels_ready: i32,
}

// ─── scorePosted ─────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyScorePosted {
  #[serde(rename = "Match")]
  pub match_:          Option<CheesyMatch>,
  pub red_score_summary: Option<CheesyScoreSummary>,
  pub blue_score_summary: Option<CheesyScoreSummary>,
  #[serde(default)]
  pub red_won:         bool,
  #[serde(default)]
  pub blue_won:        bool,
}

// ─── allianceStationDisplayMode ──────────────────────────────────────────────
// (from station WebSocket — data field is just a string)

// ─── Team ─────────────────────────────────────────────────────────────────────

#[derive(Debug, Deserialize, Clone)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyTeam {
  pub id:          u32,
  pub name:        String,
  #[serde(default)]
  pub nickname:    String,
  #[serde(default)]
  pub city:        String,
  #[serde(default)]
  pub state_prov:  String,
  #[serde(default)]
  pub country:     String,
  #[serde(default)]
  pub yellow_card: bool,
}

// ─── /api/matches/{type} response ────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyMatchWithResult {
  pub id:          i32,
  #[serde(rename = "Type", default)]
  pub match_type:  i32,
  #[serde(default)]
  pub short_name:  String,
  #[serde(default)]
  pub long_name:   String,
  #[serde(default)]
  pub red1:        u32,
  #[serde(default)]
  pub red2:        u32,
  #[serde(default)]
  pub red3:        u32,
  #[serde(default)]
  pub blue1:       u32,
  #[serde(default)]
  pub blue2:       u32,
  #[serde(default)]
  pub blue3:       u32,
  #[serde(default)]
  pub status:      i32,
  #[serde(rename = "Time")]
  pub time:        Option<String>,
  #[serde(rename = "Result")]
  pub result:      Option<CheesyMatchApiResult>,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyMatchApiResult {
  pub red_summary:  Option<CheesyScoreSummary>,
  pub blue_summary: Option<CheesyScoreSummary>,
}

// ─── /api/rankings response ───────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyRankingsResponse {
  pub rankings: Option<Vec<CheesyRankingEntry>>,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
pub struct CheesyRankingEntry {
  pub team_id:  u32,
  pub rank:     i32,
  #[serde(default)]
  pub nickname: String,
}

// ─── Match status constants (mirrors Cheesy Arena Go iota) ───────────────────

pub const STATUS_SCHEDULED: i32 = 0;
pub const STATUS_HIDDEN:    i32 = 1;
pub const STATUS_RED_WON:   i32 = 2;
pub const STATUS_BLUE_WON:  i32 = 3;
pub const STATUS_TIE:       i32 = 4;

// ─── Match state constants ────────────────────────────────────────────────────

pub const STATE_PRE_MATCH:     i32 = 0;
pub const STATE_AUTO_PERIOD:   i32 = 2;
pub const STATE_PAUSE_PERIOD:  i32 = 3;
pub const STATE_TELEOP_PERIOD: i32 = 4;
