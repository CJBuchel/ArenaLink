// ─── Cheesy Arena connector ───────────────────────────────────────────────────
//
// Connects to three Cheesy Arena WebSocket endpoints and one HTTP polling loop,
// translates wire-format messages into generic ArenaState, and broadcasts the
// result via an ArenaBroadcast channel.
//
// WebSocket endpoints:
//   /displays/field_monitor/websocket?displayId=5333  — primary field data
//   /displays/alliance_station/websocket?displayId=5334&station=R1  — display mode
//   /panels/referee/websocket                          — scoring status
//
// HTTP polling (every 30 s):
//   GET /api/matches/{practice|qualification|playoff}
//   GET /api/rankings

use std::{
  collections::HashMap,
  sync::Arc,
  time::Duration,
};

use tokio::sync::{RwLock, broadcast};
use tokio_tungstenite::{connect_async, tungstenite::Message};
use futures_util::StreamExt;

use crate::modules::fms::models::{
  ArenaState, ArenaBroadcast, DsLink, FieldState, HardwareState,
  MatchPeriodTimer, MatchRecord, MatchResult, RadioLink, ScoringPosition, StationStatus,
  TeamInfo,
};
use super::models::*;

// ─── Internal update messages ─────────────────────────────────────────────────

enum CheesyUpdate {
  FieldMessage(String),
  StationMessage(String),
  RefereeMessage(String),
  FieldConnected,
  FieldDisconnected,
  HttpData {
    match_log:    Vec<MatchRecord>,
    seen_ids:     Vec<u32>,
    rankings:     Vec<CheesyRankingEntry>,
  },
}

// ─── Internal accumulator state ───────────────────────────────────────────────

struct Accumulator {
  team_registry: HashMap<u32, TeamInfo>,
  match_log:     Vec<MatchRecord>,
  field:         FieldState,
  timing:        CheesyMatchTiming,
}

impl Accumulator {
  fn new() -> Self {
    Self {
      team_registry: HashMap::new(),
      match_log:     Vec::new(),
      field:         FieldState::default(),
      timing:        CheesyMatchTiming::default(),
    }
  }

  fn to_arena_state(&self, fms_connected: bool) -> ArenaState {
    let mut teams: Vec<TeamInfo> = self.team_registry.values().cloned().collect();
    teams.sort_by_key(|t| t.id);
    ArenaState {
      fms_connected,
      field: Some(self.field.clone()),
      teams,
      match_log: self.match_log.clone(),
    }
  }

  // ── arenaStatus ──────────────────────────────────────────────────────────

  fn merge_arena_status(&mut self, s: CheesyArenaStatus) {
    self.field.match_id = s.match_id;
    self.field.match_state = s.match_state;
    self.field.can_start_match = s.can_start_match;
    self.field.hardware = HardwareState {
      plc_healthy:       s.plc_is_healthy,
      plc_e_stop:        s.field_e_stop,
      access_point_status: if s.access_point_status == "UNKNOWN" { None } else { Some(s.access_point_status) },
      switch_status:     if s.switch_status == "UNKNOWN" { None } else { Some(s.switch_status) },
      red_scc_status:    if s.red_scc_status == "UNKNOWN" { None } else { Some(s.red_scc_status) },
      blue_scc_status:   if s.blue_scc_status == "UNKNOWN" { None } else { Some(s.blue_scc_status) },
      armor_blocks:      s.plc_armor_block_statuses.unwrap_or_default(),
      referee_ready:     self.field.hardware.referee_ready,
      scoring_positions: std::mem::take(&mut self.field.hardware.scoring_positions),
    };

    for (key, cs) in s.alliance_stations {
      let prev = self.field.stations.get(&key).cloned().unwrap_or_default();
      self.field.stations.insert(key, StationStatus {
        team_id:       cs.team.as_ref().map(|t| t.id).or(prev.team_id),
        team_name:     cs.team.as_ref().map(|t| t.name.clone()).or(prev.team_name),
        team_nickname: cs.team.as_ref().map(|t| t.nickname.clone()).or(prev.team_nickname),
        ethernet:      cs.ethernet,
        e_stop:        cs.e_stop,
        a_stop:        cs.a_stop,
        bypass:        cs.bypass,
        ds_link:       cs.ds_conn.map(|d| DsLink {
          ds_linked:       d.ds_linked,
          rio_linked:      d.rio_linked,
          code_running:    d.robot_linked,
          radio_linked:    d.radio_linked,
          battery_voltage: d.battery_voltage,
          trip_time_ms:    d.ds_robot_trip_time_ms,
          missed_packets:  d.missed_packet_count,
        }),
        radio_link: RadioLink {
          linked:             cs.wifi_status.radio_linked,
          bandwidth:          cs.wifi_status.m_bits,
          signal_noise_ratio: cs.wifi_status.signal_noise_ratio,
          connection_quality: cs.wifi_status.connection_quality,
        },
        game_data: if cs.game_data.is_empty() { None } else { Some(cs.game_data) },
      });
    }
  }

  // ── matchLoad ────────────────────────────────────────────────────────────

  fn merge_match_load(&mut self, s: CheesyMatchLoad) {
    // Register teams from this match load (richest team info we get)
    for (_, team_opt) in &s.teams {
      if let Some(t) = team_opt {
        if t.id != 0 {
          self.team_registry.insert(t.id, TeamInfo {
            id:          t.id,
            name:        t.name.clone(),
            nickname:    t.nickname.clone(),
            city:        t.city.clone(),
            state_prov:  t.state_prov.clone(),
            country:     t.country.clone(),
            yellow_card: t.yellow_card,
            rank:        self.team_registry.get(&t.id).and_then(|e| e.rank),
          });
        }
      }
    }

    self.field.match_id    = s.match_.id;
    self.field.match_name  = if !s.match_.short_name.is_empty() { s.match_.short_name.clone() } else { s.match_.long_name.clone() };
    self.field.match_type  = s.match_.match_type;
    self.field.scheduled_start = s.match_.scheduled_start_time;

    // Update station team assignments
    for (key, team_opt) in s.teams {
      let prev = self.field.stations.get(&key).cloned().unwrap_or_default();
      let (team_id, team_name, team_nickname) = match team_opt {
        Some(t) => (Some(t.id), Some(t.name), Some(t.nickname)),
        None    => (None, None, None),
      };
      self.field.stations.insert(key, StationStatus {
        team_id,
        team_name,
        team_nickname,
        ethernet:  prev.ethernet,
        e_stop:    prev.e_stop,
        a_stop:    prev.a_stop,
        bypass:    prev.bypass,
        ds_link:   prev.ds_link,
        radio_link: prev.radio_link,
        game_data: prev.game_data,
      });
    }
  }

  // ── matchTime ────────────────────────────────────────────────────────────

  fn merge_match_time(&mut self, s: CheesyMatchTime) {
    self.field.match_state   = s.match_state;
    self.field.match_time_sec = s.match_time_sec;
    self.field.timer = self.compute_timer(s.match_state, s.match_time_sec);
  }

  fn compute_timer(&self, state: i32, elapsed: i32) -> MatchPeriodTimer {
    let t = &self.timing;
    let auto_end   = t.auto_duration_sec;
    let pause_end  = auto_end + t.pause_duration_sec;
    let teleop_dur = t.teleop_duration_sec();
    let teleop_end = pause_end + teleop_dur;

    match state {
      STATE_AUTO_PERIOD => MatchPeriodTimer {
        period_label:    "AUTO".into(),
        countdown_sec:   Some((auto_end - elapsed).max(0)),
        period_total_sec: Some(auto_end),
      },
      STATE_PAUSE_PERIOD => MatchPeriodTimer {
        period_label:    "PAUSE".into(),
        countdown_sec:   Some((pause_end - elapsed).max(0).min(t.pause_duration_sec)),
        period_total_sec: Some(t.pause_duration_sec),
      },
      STATE_TELEOP_PERIOD => MatchPeriodTimer {
        period_label:    "TELEOP".into(),
        countdown_sec:   Some((teleop_end - elapsed).max(0).min(teleop_dur)),
        period_total_sec: Some(teleop_dur),
      },
      _ => MatchPeriodTimer::default(),
    }
  }

  // ── eventStatus ──────────────────────────────────────────────────────────

  fn merge_event_status(&mut self, s: CheesyEventStatus) {
    self.field.cycle_time      = s.cycle_time;
    self.field.schedule_offset = s.early_late_message;
  }

  // ── realtimeScore ────────────────────────────────────────────────────────

  fn merge_realtime_score(&mut self, s: CheesyRealtimeScore) {
    self.field.red_score   = Some(s.red.score_summary.score);
    self.field.blue_score  = Some(s.blue.score_summary.score);
    self.field.match_state = s.match_state;
  }

  // ── scoringStatus ────────────────────────────────────────────────────────

  fn merge_scoring_status(&mut self, s: CheesyScoringStatus) {
    self.field.hardware.referee_ready = s.referee_score_ready;
    self.field.hardware.scoring_positions = s.position_statuses
      .into_iter()
      .map(|(k, v)| (k, ScoringPosition { ready: v.ready, num_panels: v.num_panels, num_panels_ready: v.num_panels_ready }))
      .collect();
  }

  // ── scorePosted ──────────────────────────────────────────────────────────

  fn merge_score_posted(&mut self, s: CheesyScorePosted) {
    let m = match s.match_ { Some(m) => m, None => return };
    let result = if s.red_won { MatchResult::RedWon } else if s.blue_won { MatchResult::BlueWon } else { MatchResult::Tie };
    let record = MatchRecord {
      id:        m.id,
      name:      if !m.short_name.is_empty() { m.short_name } else { m.long_name },
      played_at: m.scheduled_start_time,
      red_teams: vec![opt_id(m.red1), opt_id(m.red2), opt_id(m.red3)],
      blue_teams: vec![opt_id(m.blue1), opt_id(m.blue2), opt_id(m.blue3)],
      red_score:  s.red_score_summary.map(|r| r.score),
      blue_score: s.blue_score_summary.map(|b| b.score),
      result,
    };
    if let Some(idx) = self.match_log.iter().position(|r| r.id == m.id) {
      self.match_log[idx] = record;
    } else {
      self.match_log.push(record);
    }
  }

  // ── HTTP data ─────────────────────────────────────────────────────────────

  fn merge_http_data(&mut self, records: Vec<MatchRecord>, seen_ids: Vec<u32>, rankings: Vec<CheesyRankingEntry>) {
    // Stub-register any teams seen in match data not yet in registry
    for id in seen_ids {
      self.team_registry.entry(id).or_insert_with(|| TeamInfo::stub(id));
    }

    // Enrich with ranking data
    for r in rankings {
      let entry = self.team_registry.entry(r.team_id).or_insert_with(|| TeamInfo::stub(r.team_id));
      entry.rank = Some(r.rank);
      if entry.nickname.is_empty() && !r.nickname.is_empty() {
        entry.nickname = r.nickname;
      }
    }

    if !records.is_empty() || !self.match_log.is_empty() {
      self.match_log = records;
    }
  }
}

fn opt_id(id: u32) -> Option<u32> { if id == 0 { None } else { Some(id) } }

// ─── Public entry point ───────────────────────────────────────────────────────

pub async fn run_cheesy_connector(
  host:      String,
  port:      u16,
  tx:        ArenaBroadcast,
  state:     Arc<RwLock<ArenaState>>,
  mut shutdown_rx: broadcast::Receiver<()>,
) {
  log::info!("[FMS/Cheesy] Connector starting → {}:{}", host, port);

  let (update_tx, mut update_rx) = tokio::sync::mpsc::channel::<CheesyUpdate>(512);
  let mut acc = Accumulator::new();
  let mut fms_connected = false;

  // Spawn background tasks that send updates to update_tx
  let field_url   = format!("ws://{}:{}/displays/field_monitor/websocket?displayId=5333", host, port);
  let station_url = format!("ws://{}:{}/displays/alliance_station/websocket?displayId=5334&station=R1", host, port);
  let referee_url = format!("ws://{}:{}/panels/referee/websocket", host, port);
  let http_base   = format!("http://{}:{}", host, port);

  {
    let tx2 = update_tx.clone();
    let u   = field_url.clone();
    tokio::spawn(async move { ws_loop(u, "field", tx2, true).await; });
  }
  {
    let tx2 = update_tx.clone();
    let u   = station_url.clone();
    tokio::spawn(async move { ws_loop(u, "station", tx2, false).await; });
  }
  {
    let tx2 = update_tx.clone();
    let u   = referee_url.clone();
    tokio::spawn(async move { ws_loop(u, "referee", tx2, false).await; });
  }
  {
    let tx2 = update_tx.clone();
    let base = http_base.clone();
    tokio::spawn(async move { http_poll_loop(base, tx2).await; });
  }

  // Broadcast helper
  let broadcast = |s: &ArenaState, tx: &ArenaBroadcast, state: &Arc<RwLock<ArenaState>>| {
    let s = s.clone();
    let tx = tx.clone();
    let state = state.clone();
    tokio::spawn(async move {
      *state.write().await = s.clone();
      let _ = tx.send(s);
    });
  };

  loop {
    tokio::select! {
      msg = update_rx.recv() => {
        let update = match msg { Some(u) => u, None => break };
        match update {
          CheesyUpdate::FieldConnected => {
            log::info!("[FMS/Cheesy] Field monitor WS connected");
            fms_connected = true;
            let s = acc.to_arena_state(fms_connected);
            broadcast(&s, &tx, &state);
          }
          CheesyUpdate::FieldDisconnected => {
            log::warn!("[FMS/Cheesy] Field monitor WS disconnected");
            fms_connected = false;
            let s = acc.to_arena_state(fms_connected);
            broadcast(&s, &tx, &state);
          }
          CheesyUpdate::FieldMessage(raw) => {
            if let Some(changed) = process_field_message(&raw, &mut acc) {
              if changed {
                let s = acc.to_arena_state(fms_connected);
                broadcast(&s, &tx, &state);
              }
            }
          }
          CheesyUpdate::StationMessage(raw) => {
            if let Ok(msg) = serde_json::from_str::<serde_json::Value>(&raw) {
              if msg.get("type").and_then(|t| t.as_str()) == Some("allianceStationDisplayMode") {
                if let Some(mode) = msg.get("data").and_then(|d| d.as_str()) {
                  acc.field.display_mode = Some(mode.to_string());
                  let s = acc.to_arena_state(fms_connected);
                  broadcast(&s, &tx, &state);
                }
              }
            }
          }
          CheesyUpdate::RefereeMessage(raw) => {
            if let Ok(msg) = serde_json::from_str::<serde_json::Value>(&raw) {
              if msg.get("type").and_then(|t| t.as_str()) == Some("scoringStatus") {
                if let Some(data) = msg.get("data") {
                  if let Ok(s) = serde_json::from_value::<CheesyScoringStatus>(data.clone()) {
                    acc.merge_scoring_status(s);
                    let state2 = acc.to_arena_state(fms_connected);
                    broadcast(&state2, &tx, &state);
                  }
                }
              }
            }
          }
          CheesyUpdate::HttpData { match_log, seen_ids, rankings } => {
            acc.merge_http_data(match_log, seen_ids, rankings);
            let s = acc.to_arena_state(fms_connected);
            broadcast(&s, &tx, &state);
          }
        }
      }

      _ = shutdown_rx.recv() => {
        log::info!("[FMS/Cheesy] Connector shutting down");
        break;
      }
    }
  }
}

// ─── Field message dispatcher ─────────────────────────────────────────────────

fn process_field_message(raw: &str, acc: &mut Accumulator) -> Option<bool> {
  let v: serde_json::Value = serde_json::from_str(raw).ok()?;
  let msg_type = v.get("type")?.as_str()?;
  let data = v.get("data")?;

  match msg_type {
    "arenaStatus" => {
      if let Ok(s) = serde_json::from_value::<CheesyArenaStatus>(data.clone()) {
        acc.merge_arena_status(s);
        return Some(true);
      }
    }
    "matchLoad" => {
      if let Some(s) = CheesyMatchLoad::from_value(data.clone()) {
        acc.merge_match_load(s);
        return Some(true);
      }
    }
    "matchTime" => {
      if let Ok(s) = serde_json::from_value::<CheesyMatchTime>(data.clone()) {
        acc.merge_match_time(s);
        return Some(true);
      }
    }
    "matchTiming" => {
      if let Ok(s) = serde_json::from_value::<CheesyMatchTiming>(data.clone()) {
        acc.timing = s;
        return Some(false);
      }
    }
    "eventStatus" => {
      if let Ok(s) = serde_json::from_value::<CheesyEventStatus>(data.clone()) {
        acc.merge_event_status(s);
        return Some(true);
      }
    }
    "realtimeScore" => {
      if let Ok(s) = serde_json::from_value::<CheesyRealtimeScore>(data.clone()) {
        acc.merge_realtime_score(s);
        return Some(true);
      }
    }
    "scorePosted" => {
      if let Ok(s) = serde_json::from_value::<CheesyScorePosted>(data.clone()) {
        acc.merge_score_posted(s);
        return Some(true);
      }
    }
    _ => {}
  }
  Some(false)
}

// ─── WebSocket loop ───────────────────────────────────────────────────────────

async fn ws_loop(
  url:        String,
  name:       &'static str,
  tx:         tokio::sync::mpsc::Sender<CheesyUpdate>,
  is_primary: bool,
) {
  let mut delay = Duration::from_secs(1);
  loop {
    log::debug!("[FMS/Cheesy/{name}] Connecting to {url}");
    match connect_async(&url).await {
      Ok((mut ws, _)) => {
        log::info!("[FMS/Cheesy/{name}] Connected");
        delay = Duration::from_secs(1); // reset backoff
        if is_primary {
          let _ = tx.send(CheesyUpdate::FieldConnected).await;
        }
        while let Some(msg) = ws.next().await {
          match msg {
            Ok(Message::Text(text)) => {
              let update = if is_primary {
                CheesyUpdate::FieldMessage(text.to_string())
              } else if name == "station" {
                CheesyUpdate::StationMessage(text.to_string())
              } else {
                CheesyUpdate::RefereeMessage(text.to_string())
              };
              if tx.send(update).await.is_err() { return; }
            }
            Ok(Message::Close(_)) | Err(_) => break,
            _ => {}
          }
        }
        log::warn!("[FMS/Cheesy/{name}] Disconnected");
        if is_primary {
          let _ = tx.send(CheesyUpdate::FieldDisconnected).await;
        }
      }
      Err(e) => {
        log::debug!("[FMS/Cheesy/{name}] Connect failed: {e}");
      }
    }

    tokio::time::sleep(delay).await;
    delay = (delay * 2).min(Duration::from_secs(10));
  }
}

// ─── HTTP polling loop ────────────────────────────────────────────────────────

async fn http_poll_loop(base_url: String, tx: tokio::sync::mpsc::Sender<CheesyUpdate>) {
  // Initial poll after 2 s (give WS time to connect first), then every 30 s
  tokio::time::sleep(Duration::from_secs(2)).await;
  let mut interval = tokio::time::interval(Duration::from_secs(30));

  loop {
    let result = fetch_http_data(&base_url).await;
    match result {
      Ok((match_log, seen_ids, rankings)) => {
        if tx.send(CheesyUpdate::HttpData { match_log, seen_ids, rankings }).await.is_err() {
          return;
        }
      }
      Err(e) => log::warn!("[FMS/Cheesy/http] Poll failed: {e}"),
    }
    interval.tick().await;
  }
}

async fn fetch_http_data(
  base_url: &str,
) -> anyhow::Result<(Vec<MatchRecord>, Vec<u32>, Vec<CheesyRankingEntry>)> {
  let client = reqwest::Client::builder()
    .timeout(Duration::from_secs(8))
    .build()?;

  let mut all_records: Vec<MatchRecord> = Vec::new();
  let mut seen_ids:   Vec<u32>         = Vec::new();

  for match_type in &["practice", "qualification", "playoff"] {
    let url = format!("{base_url}/api/matches/{match_type}");
    let resp = match client.get(&url).send().await {
      Ok(r) if r.status().is_success() => r,
      Ok(r) => {
        log::debug!("[FMS/Cheesy/http] GET {url} → {}", r.status());
        continue;
      }
      Err(e) => {
        log::debug!("[FMS/Cheesy/http] GET {url} failed: {e}");
        continue;
      }
    };

    let text = resp.text().await?;
    let list: Vec<CheesyMatchWithResult> = match serde_json::from_str(&text) {
      Ok(l) => l,
      Err(e) => {
        log::warn!("[FMS/Cheesy/http] Parse error for {url}: {e}");
        continue;
      }
    };

    for m in list {
      for id in [m.red1, m.red2, m.red3, m.blue1, m.blue2, m.blue3] {
        if id != 0 { seen_ids.push(id); }
      }

      if m.status == STATUS_SCHEDULED || m.status == STATUS_HIDDEN { continue; }

      let result = match m.status {
        STATUS_RED_WON  => MatchResult::RedWon,
        STATUS_BLUE_WON => MatchResult::BlueWon,
        STATUS_TIE      => MatchResult::Tie,
        _               => MatchResult::NotPlayed,
      };

      all_records.push(MatchRecord {
        id:        m.id,
        name:      if !m.short_name.is_empty() { m.short_name } else { m.long_name },
        played_at: m.time,
        red_teams: vec![opt_id(m.red1), opt_id(m.red2), opt_id(m.red3)],
        blue_teams: vec![opt_id(m.blue1), opt_id(m.blue2), opt_id(m.blue3)],
        red_score:  m.result.as_ref().and_then(|r| r.red_summary.as_ref()).map(|s| s.score),
        blue_score: m.result.as_ref().and_then(|r| r.blue_summary.as_ref()).map(|s| s.score),
        result,
      });
    }
  }

  all_records.sort_by_key(|r| r.id);

  // Rankings
  let rankings_url = format!("{base_url}/api/rankings");
  let rankings: Vec<CheesyRankingEntry> = match client.get(&rankings_url).send().await {
    Ok(r) if r.status().is_success() => {
      let text = r.text().await.unwrap_or_default();
      serde_json::from_str::<CheesyRankingsResponse>(&text)
        .ok()
        .and_then(|r| r.rankings)
        .unwrap_or_default()
    }
    _ => Vec::new(),
  };

  Ok((all_records, seen_ids, rankings))
}
