use std::{net::SocketAddr, sync::Arc};

use anyhow::Result;
use tokio::sync::RwLock;

use crate::{
  config::ServerConfig,
  core::{scheduler::SchedulerPool, shutdown::ShutdownNotifier},
  modules::{
    api::{AppState, router},
    discord::{
      DiscordNotificationService, discord_bot_service, new_alert_registry, new_status_broadcast,
    },
    fms::{
      LogProvider,
      models::{ArenaState, new_arena_broadcast},
      cheesy::run_cheesy_connector,
    },
  },
};

pub struct Server {
  config:    ServerConfig,
  scheduler: SchedulerPool,
}

impl Server {
  pub fn new(config: Option<ServerConfig>) -> Self {
    let config = match config {
      Some(cfg) => cfg,
      None => ServerConfig::load(),
    };

    Self { config, scheduler: SchedulerPool::new() }
  }

  pub async fn run(mut self) -> Result<()> {
    log::info!("Running server with config: {:?}", self.config);

    database::init_db(&self.config.db_path)?;

    let shutdown_notifier = ShutdownNotifier::get();

    // ── Alert registry & broadcast ────────────────────────────────────────────
    let alert_registry = new_alert_registry();
    let status_tx      = new_status_broadcast();

    // ── Arena state (shared between FMS connector and API handlers) ───────────
    let arena_state = Arc::new(RwLock::new(ArenaState::default()));
    let arena_tx    = new_arena_broadcast();

    // ── Periodic background services ──────────────────────────────────────────
    self.scheduler.schedule(DiscordNotificationService::new(), shutdown_notifier);

    // ── Discord gateway + interaction handler ─────────────────────────────────
    self.scheduler.spawn(discord_bot_service(
      alert_registry.clone(),
      status_tx.clone(),
      shutdown_notifier,
    ));

    // ── FMS connector ─────────────────────────────────────────────────────────
    {
      let host      = self.config.fms_host.clone();
      let port      = self.config.fms_port;
      let tx        = arena_tx.clone();
      let state     = arena_state.clone();
      let shutdown  = shutdown_notifier.subscribe();

      self.scheduler.spawn(async move {
        run_cheesy_connector(host, port, tx, state, shutdown).await;
      });
    }

    // ── Axum HTTP + WebSocket server ──────────────────────────────────────────
    let log_provider = Arc::new(LogProvider::cheesy(&self.config.fms_host, self.config.fms_port));
    let app_state = AppState {
      config:       crate::config::DiscordConfig::from_env(),
      registry:     alert_registry,
      status_tx,
      arena_state,
      arena_tx,
      log_provider,
    };

    let app  = router(app_state, self.config.web_dir.clone());
    let addr = SocketAddr::new(self.config.addr, self.config.port);

    let listener = tokio::net::TcpListener::bind(addr).await?;
    log::info!("HTTP API listening on http://{addr}");

    let mut http_shutdown_rx = shutdown_notifier.subscribe();
    self.scheduler.spawn(async move {
      axum::serve(listener, app)
        .with_graceful_shutdown(async move {
          let _ = http_shutdown_rx.recv().await;
          log::info!("HTTP server shutting down");
        })
        .await
        .expect("axum server error");
    });

    self.scheduler.wait_all().await?;

    Ok(())
  }
}
