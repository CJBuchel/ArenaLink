// ─── REST + WebSocket API ─────────────────────────────────────────────────────
//
// Routes:
//   GET  /ws                                    — WebSocket: live ArenaState stream
//   GET  /api/arena/state                       — current ArenaState snapshot (REST)
//   GET  /api/arena/teams                       — team list from current state
//   GET  /api/arena/matches                     — match log from current state
//   GET  /api/arena/logs?match=<name>&team=<id> — per-robot match telemetry log
//   POST /api/alerts                            — submit a new pit alert
//   GET  /api/alerts/status                     — WebSocket: real-time TeamStatusUpdate stream
//   GET  /api/alerts/history/{team_id}          — full alert history for one team

use std::sync::Arc;

use axum::{
  Router,
  extract::{
    Path, Query, State, WebSocketUpgrade,
    ws::{Message, WebSocket},
  },
  http::StatusCode,
  http::Method,
  response::{IntoResponse, Response},
  routing::{get, post},
};
use serde::{Deserialize, Serialize};
use tokio::sync::RwLock;
use tower_http::{
  cors::{Any, CorsLayer},
  services::{ServeDir, ServeFile},
};

use database::AlertRepository;

use crate::{
  config::DiscordConfig,
  modules::{
    discord::{
      AlertRecipient, AlertRegistry, AlertSummary, MatchContext, PitAlert, PitAlertType,
      StatusBroadcast, post_pit_alert,
      types::IssueStatus,
    },
    fms::{LogProvider, models::{ArenaState, ArenaBroadcast}},
  },
};

// ─── Shared state ─────────────────────────────────────────────────────────────

#[derive(Clone)]
pub struct AppState {
  pub config:       DiscordConfig,
  pub registry:     AlertRegistry,
  pub status_tx:    StatusBroadcast,
  /// Live arena state — updated by the FMS connector.
  pub arena_state:  Arc<RwLock<ArenaState>>,
  /// Broadcast channel — FMS connector publishes every state update here.
  pub arena_tx:     ArenaBroadcast,
  /// Backend-agnostic log fetcher — implementation selected by FMS_TYPE.
  pub log_provider: Arc<LogProvider>,
}

// ─── Request / response types ─────────────────────────────────────────────────

#[derive(Debug, Deserialize)]
pub struct AlertRequest {
  pub team_id:          Option<i32>,
  pub team_name:        Option<String>,
  pub station:          String,
  pub alert_type:       String,
  pub sub_issues:       Option<Vec<String>>,
  pub recipients:       Option<Vec<String>>,
  pub field_notes:      Option<String>,
  pub match_name:       Option<String>,
  pub match_type_label: Option<String>,
  pub match_state_label: Option<String>,
  pub time_remaining_sec: Option<i32>,
  pub scheduled_start:  Option<String>,
}

#[derive(Debug, Serialize)]
pub struct AlertResponse {
  pub ok:      bool,
  pub message: String,
}

impl AlertResponse {
  fn ok(msg: impl Into<String>) -> (StatusCode, axum::Json<Self>) {
    (StatusCode::OK, axum::Json(Self { ok: true, message: msg.into() }))
  }

  fn err(status: StatusCode, msg: impl Into<String>) -> (StatusCode, axum::Json<Self>) {
    (status, axum::Json(Self { ok: false, message: msg.into() }))
  }
}

// ─── Router ───────────────────────────────────────────────────────────────────

pub fn router(state: AppState, web_dir: String) -> Router {
  let cors = CorsLayer::new()
    .allow_origin(Any)
    .allow_methods([Method::GET, Method::POST, Method::OPTIONS])
    .allow_headers(Any)
    .expose_headers([axum::http::header::CONTENT_TYPE]);

  Router::new()
    // Arena state — WebSocket (primary Flutter client connection)
    .route("/ws", get(arena_ws_handler))
    // Arena state — REST snapshots
    .route("/api/arena/state",   get(arena_state_handler))
    .route("/api/arena/teams",   get(arena_teams_handler))
    .route("/api/arena/matches", get(arena_matches_handler))
    .route("/api/arena/logs",    get(arena_logs_handler))
    // Pit alerts
    .route("/api/alerts",                   post(post_alert_handler))
    .route("/api/alerts/status",            get(status_ws_handler))
    .route("/api/alerts/history/{team_id}", get(alert_history_handler))
    // Flutter web app — served as fallback for all unmatched routes
    .fallback_service(
      ServeDir::new(&web_dir)
        .fallback(ServeFile::new(format!("{web_dir}/index.html")))
    )
    .layer(cors)
    .with_state(state)
}

// ─── GET /ws (WebSocket) — live ArenaState stream ────────────────────────────

async fn arena_ws_handler(
  ws:           WebSocketUpgrade,
  State(state): State<AppState>,
) -> Response {
  ws.on_upgrade(move |socket| {
    handle_arena_socket(socket, state.arena_state, state.arena_tx.subscribe())
  })
}

async fn handle_arena_socket(
  mut socket:   WebSocket,
  arena_state:  Arc<RwLock<ArenaState>>,
  mut rx:       tokio::sync::broadcast::Receiver<ArenaState>,
) {
  log::info!("[API/WS] Arena client connected");

  // Send current state snapshot immediately
  {
    let snap = arena_state.read().await.clone();
    match serde_json::to_string(&snap) {
      Ok(json) => {
        if socket.send(Message::Text(json.into())).await.is_err() {
          log::info!("[API/WS] Arena client disconnected during snapshot");
          return;
        }
      }
      Err(e) => log::error!("[API/WS] Snapshot serialize error: {e}"),
    }
  }

  loop {
    tokio::select! {
      result = rx.recv() => {
        match result {
          Ok(state) => {
            match serde_json::to_string(&state) {
              Ok(json) => {
                if socket.send(Message::Text(json.into())).await.is_err() {
                  break;
                }
              }
              Err(e) => log::error!("[API/WS] Serialize error: {e}"),
            }
          }
          Err(tokio::sync::broadcast::error::RecvError::Lagged(n)) => {
            log::warn!("[API/WS] Arena WS client lagged, dropped {n} updates");
          }
          Err(tokio::sync::broadcast::error::RecvError::Closed) => break,
        }
      }

      msg = socket.recv() => {
        match msg {
          Some(Ok(Message::Close(_))) | None => break,
          Some(Ok(_)) => {}
          Some(Err(e)) => {
            log::warn!("[API/WS] Receive error: {e}");
            break;
          }
        }
      }
    }
  }

  log::info!("[API/WS] Arena client disconnected");
}

// ─── GET /api/arena/state ─────────────────────────────────────────────────────

async fn arena_state_handler(State(state): State<AppState>) -> Response {
  axum::Json(state.arena_state.read().await.clone()).into_response()
}

// ─── GET /api/arena/teams ─────────────────────────────────────────────────────

async fn arena_teams_handler(State(state): State<AppState>) -> Response {
  axum::Json(state.arena_state.read().await.teams.clone()).into_response()
}

// ─── GET /api/arena/matches ───────────────────────────────────────────────────

async fn arena_matches_handler(State(state): State<AppState>) -> Response {
  axum::Json(state.arena_state.read().await.match_log.clone()).into_response()
}

// ─── POST /api/alerts ─────────────────────────────────────────────────────────

async fn post_alert_handler(
  State(state): State<AppState>,
  axum::Json(req): axum::Json<AlertRequest>,
) -> Response {
  log::info!(
    "[API] POST /api/alerts — station={} type={} team={:?}",
    req.station, req.alert_type, req.team_id,
  );

  let Some(alert_type) = PitAlertType::from_str(&req.alert_type) else {
    return AlertResponse::err(
      StatusCode::BAD_REQUEST,
      format!("Unknown alert_type: {}", req.alert_type),
    ).into_response();
  };

  let recipients = req.recipients.unwrap_or_default()
    .iter()
    .filter_map(|s| AlertRecipient::from_str(s))
    .collect::<Vec<_>>();

  let mention_text = state.config.build_mentions(&recipients);

  let match_ctx = MatchContext {
    match_name:        req.match_name.unwrap_or_else(|| "—".to_string()),
    match_type_label:  req.match_type_label.unwrap_or_default(),
    match_state_label: req.match_state_label.unwrap_or_else(|| "Unknown".to_string()),
    time_remaining_sec: req.time_remaining_sec,
    scheduled_start:   req.scheduled_start,
  };

  let pit_map_url = req.team_id.and_then(|id| state.config.nexus_pit_map_url(id as u32));

  let alert = PitAlert {
    team_id:     req.team_id,
    team_name:   req.team_name,
    station:     req.station,
    match_ctx,
    alert_type,
    sub_issues:  req.sub_issues.unwrap_or_default(),
    recipients,
    mention_text,
    field_notes: req.field_notes,
    status:      IssueStatus::Flagged,
    action_by:   None,
    pit_map_url,
  };

  match post_pit_alert(&state.config, &state.registry, &state.status_tx, alert).await {
    Ok(()) => AlertResponse::ok("Alert posted").into_response(),
    Err(e) => {
      log::error!("[API] Failed to post alert: {e}");
      AlertResponse::err(StatusCode::INTERNAL_SERVER_ERROR, e.to_string()).into_response()
    }
  }
}

// ─── GET /api/alerts/history/{team_id} ───────────────────────────────────────

async fn alert_history_handler(
  Path(team_id): Path<u32>,
  _state: State<AppState>,
) -> Response {
  match AlertRepository::get_for_team(team_id as i32) {
    Ok(records) => {
      let alerts: Vec<AlertSummary> = records
        .into_iter()
        .map(|(_, r)| AlertSummary {
          alert_type:       r.alert_type,
          sub_issues:       r.sub_issues,
          status:           match r.status.as_str() {
            "InProgress" => IssueStatus::InProgress,
            "Resolved"   => IssueStatus::Resolved,
            _            => IssueStatus::Flagged,
          },
          action_by:        r.action_by,
          station:          r.station,
          match_name:       r.match_name,
          match_state_label: r.match_state_label,
          field_notes:      r.field_notes,
        })
        .collect();
      axum::Json(alerts).into_response()
    }
    Err(e) => {
      log::error!("[API] GET /api/alerts/history/{team_id} — DB error: {e}");
      StatusCode::INTERNAL_SERVER_ERROR.into_response()
    }
  }
}

// ─── GET /api/alerts/status (WebSocket) ──────────────────────────────────────

async fn status_ws_handler(
  ws:           WebSocketUpgrade,
  State(state): State<AppState>,
) -> Response {
  ws.on_upgrade(move |socket| {
    handle_status_socket(socket, state.registry, state.status_tx.subscribe())
  })
}

async fn handle_status_socket(
  mut socket: WebSocket,
  registry:   crate::modules::discord::AlertRegistry,
  mut rx:     tokio::sync::broadcast::Receiver<crate::modules::discord::TeamStatusUpdate>,
) {
  use crate::modules::discord::{TeamStatusUpdate, types::TeamTicketStatus};

  log::info!("[API] Alert status WS client connected");

  let snapshots: Vec<TeamStatusUpdate> = {
    let s = registry.lock().await;
    s.all_team_ids()
      .into_iter()
      .filter_map(|team_id| {
        let status = s.team_status(team_id);
        if status == TeamTicketStatus::Clear { return None; }
        Some(TeamStatusUpdate { team_id, status, open_count: s.team_open_count(team_id) })
      })
      .collect()
  };

  for update in snapshots {
    if let Ok(json) = serde_json::to_string(&update) {
      if socket.send(Message::Text(json.into())).await.is_err() {
        return;
      }
    }
  }

  loop {
    tokio::select! {
      result = rx.recv() => {
        match result {
          Ok(update) => {
            if let Ok(json) = serde_json::to_string(&update) {
              if socket.send(Message::Text(json.into())).await.is_err() { break; }
            }
          }
          Err(tokio::sync::broadcast::error::RecvError::Lagged(n)) => {
            log::warn!("[API] Alert WS client lagged, dropped {n} updates");
          }
          Err(tokio::sync::broadcast::error::RecvError::Closed) => break,
        }
      }
      msg = socket.recv() => {
        match msg {
          Some(Ok(Message::Close(_))) | None => break,
          Some(Ok(_)) => {}
          Some(Err(e)) => { log::warn!("[API] Alert WS receive error: {e}"); break; }
        }
      }
    }
  }

  log::info!("[API] Alert status WS client disconnected");
}

// ─── GET /api/arena/logs?match=<shortName>&team=<teamId> ─────────────────────
//
// Returns per-robot telemetry for a single team's most-recent replay of a match.
// The backend (Cheesy Arena, real FMS, …) is selected by the LogProvider in
// AppState — the client never sees CSV bytes or vendor file-naming schemes.

#[derive(Debug, Deserialize)]
struct LogQuery {
  #[serde(rename = "match")]
  match_name: String,
  team: u32,
}

async fn arena_logs_handler(
  Query(q):     Query<LogQuery>,
  State(state): State<AppState>,
) -> Response {
  log::debug!("[API] GET /api/arena/logs match={} team={}", q.match_name, q.team);
  match state.log_provider.fetch_logs(&q.match_name, q.team).await {
    Ok(entries) => axum::Json(entries).into_response(),
    Err(e) => {
      log::warn!("[API] GET /api/arena/logs failed: {e}");
      StatusCode::BAD_GATEWAY.into_response()
    }
  }
}
