// ─── REST + WebSocket API ─────────────────────────────────────────────────────
//
// Routes:
//   POST /api/alerts                   — submit a new pit alert
//   GET  /api/alerts/status            — WebSocket: real-time TeamStatusUpdate stream
//   GET  /api/alerts/history/{team_id} — full alert history for one team

use axum::{
  Router,
  extract::{
    Path, State, WebSocketUpgrade,
    ws::{Message, WebSocket},
  },
  http::{Method, StatusCode},
  response::{IntoResponse, Response},
  routing::{get, post},
};
use serde::{Deserialize, Serialize};
use tower_http::cors::{Any, CorsLayer};

use crate::{
  config::DiscordConfig,
  modules::discord::{
    AlertRecipient, AlertRegistry, AlertSummary, MatchContext, PitAlert, PitAlertType,
    StatusBroadcast, post_pit_alert,
    types::IssueStatus,
  },
};

// ─── Shared state ─────────────────────────────────────────────────────────────

#[derive(Clone)]
pub struct AppState {
  pub config: DiscordConfig,
  pub registry: AlertRegistry,
  pub status_tx: StatusBroadcast,
}

// ─── Request / response types ─────────────────────────────────────────────────

/// Incoming JSON body for POST /api/alerts.
#[derive(Debug, Deserialize)]
pub struct AlertRequest {
  pub team_id: Option<i32>,
  pub team_name: Option<String>,
  pub station: String,
  pub alert_type: String,
  pub sub_issues: Option<Vec<String>>,
  pub recipients: Option<Vec<String>>,
  pub field_notes: Option<String>,
  pub match_name: Option<String>,
  pub match_type_label: Option<String>,
  pub match_state_label: Option<String>,
  pub time_remaining_sec: Option<i32>,
  pub scheduled_start: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct AlertResponse {
  pub ok: bool,
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

pub fn router(state: AppState) -> Router {
  let cors = CorsLayer::new()
    .allow_origin(Any)
    .allow_methods([Method::GET, Method::POST, Method::OPTIONS])
    .allow_headers(Any)
    .expose_headers([axum::http::header::CONTENT_TYPE]);

  Router::new()
    .route("/api/alerts", post(post_alert_handler))
    .route("/api/alerts/status", get(status_ws_handler))
    .route("/api/alerts/history/{team_id}", get(alert_history_handler))
    .layer(cors)
    .with_state(state)
}

// ─── POST /api/alerts ─────────────────────────────────────────────────────────

async fn post_alert_handler(
  State(state): State<AppState>,
  axum::Json(req): axum::Json<AlertRequest>,
) -> Response {
  log::info!(
    "[API] POST /api/alerts — station={} type={} team={:?}",
    req.station,
    req.alert_type,
    req.team_id,
  );

  let Some(alert_type) = PitAlertType::from_str(&req.alert_type) else {
    log::warn!("[API] Unknown alert_type: {}", req.alert_type);
    return AlertResponse::err(
      StatusCode::BAD_REQUEST,
      format!("Unknown alert_type: {}", req.alert_type),
    )
    .into_response();
  };

  let recipients = req
    .recipients
    .unwrap_or_default()
    .iter()
    .filter_map(|s| AlertRecipient::from_str(s))
    .collect::<Vec<_>>();

  let mention_text = state.config.build_mentions(&recipients);

  let match_ctx = MatchContext {
    match_name: req.match_name.unwrap_or_else(|| "—".to_string()),
    match_type_label: req.match_type_label.unwrap_or_default(),
    match_state_label: req.match_state_label.unwrap_or_else(|| "Unknown".to_string()),
    time_remaining_sec: req.time_remaining_sec,
    scheduled_start: req.scheduled_start,
  };

  let alert = PitAlert {
    team_id: req.team_id,
    team_name: req.team_name,
    station: req.station,
    match_ctx,
    alert_type,
    sub_issues: req.sub_issues.unwrap_or_default(),
    recipients,
    mention_text,
    field_notes: req.field_notes,
    status: IssueStatus::Flagged,
    action_by: None,
  };

  match post_pit_alert(&state.config, &state.registry, &state.status_tx, alert).await {
    Ok(()) => {
      log::info!("[API] Alert posted successfully");
      AlertResponse::ok("Alert posted").into_response()
    }
    Err(e) => {
      log::error!("[API] Failed to post alert: {e}");
      AlertResponse::err(StatusCode::INTERNAL_SERVER_ERROR, e.to_string()).into_response()
    }
  }
}

// ─── GET /api/alerts/history/{team_id} ───────────────────────────────────────

async fn alert_history_handler(
  Path(team_id): Path<u32>,
  State(state): State<AppState>,
) -> Response {
  let state = state.registry.lock().await;
  let alerts: Vec<AlertSummary> = state.team_alerts(team_id);
  drop(state);

  log::debug!("[API] GET /api/alerts/history/{team_id} — {} alerts", alerts.len());
  axum::Json(alerts).into_response()
}

// ─── GET /api/alerts/status (WebSocket) ──────────────────────────────────────

async fn status_ws_handler(
  ws: WebSocketUpgrade,
  State(state): State<AppState>,
) -> Response {
  ws.on_upgrade(move |socket| {
    handle_status_socket(socket, state.registry, state.status_tx.subscribe())
  })
}

async fn handle_status_socket(
  mut socket: WebSocket,
  registry: crate::modules::discord::AlertRegistry,
  mut rx: tokio::sync::broadcast::Receiver<crate::modules::discord::TeamStatusUpdate>,
) {
  use crate::modules::discord::{TeamStatusUpdate, types::TeamTicketStatus};

  log::info!("[API] WebSocket client connected for alert status stream");

  // ── Send snapshot of all current team statuses ────────────────────────────
  // Collect while holding the lock, then send without holding it.
  let snapshots: Vec<TeamStatusUpdate> = {
    let state = registry.lock().await;
    state.all_team_ids()
      .into_iter()
      .filter_map(|team_id| {
        let status = state.team_status(team_id);
        if status == TeamTicketStatus::Clear { return None; }
        let open_count = state.team_open_count(team_id);
        Some(TeamStatusUpdate { team_id, status, open_count })
      })
      .collect()
  };

  log::debug!("[API] Sending snapshot of {} team statuses to new WS client", snapshots.len());
  for update in snapshots {
    match serde_json::to_string(&update) {
      Ok(json) => {
        if socket.send(Message::Text(json.into())).await.is_err() {
          log::info!("[API] WebSocket client disconnected during snapshot send");
          return;
        }
      }
      Err(e) => log::error!("[API] Failed to serialize snapshot: {e}"),
    }
  }

  loop {
    tokio::select! {
      result = rx.recv() => {
        match result {
          Ok(update) => {
            match serde_json::to_string(&update) {
              Ok(json) => {
                if socket.send(Message::Text(json.into())).await.is_err() {
                  break;
                }
              }
              Err(e) => log::error!("[API] Failed to serialize TeamStatusUpdate: {e}"),
            }
          }
          Err(tokio::sync::broadcast::error::RecvError::Lagged(n)) => {
            log::warn!("[API] WS client lagged, dropped {n} status updates");
          }
          Err(tokio::sync::broadcast::error::RecvError::Closed) => break,
        }
      }

      msg = socket.recv() => {
        match msg {
          Some(Ok(Message::Close(_))) | None => break,
          Some(Ok(_)) => {}
          Some(Err(e)) => {
            log::warn!("[API] WS receive error: {e}");
            break;
          }
        }
      }
    }
  }

  log::info!("[API] WebSocket client disconnected");
}
