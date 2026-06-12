use std::net::SocketAddr;

use anyhow::Result;

use crate::{
  config::ServerConfig,
  core::{scheduler::SchedulerPool, shutdown::ShutdownNotifier},
  modules::{
    api::{AppState, router},
    discord::{
      DiscordNotificationService, discord_bot_service, new_alert_registry, new_status_broadcast,
    },
  },
};

pub struct Server {
  config: ServerConfig,
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

    let shutdown_notifier = ShutdownNotifier::get();

    // Shared in-memory store for live pit alerts.
    let alert_registry = new_alert_registry();

    // Real-time broadcast channel — shared by the API (writes on new alert)
    // and the Discord bot (writes on button click); WS clients subscribe.
    let status_tx = new_status_broadcast();

    // ── Periodic background services ──────────────────────────────────────────
    self.scheduler.schedule(DiscordNotificationService::new(), shutdown_notifier);

    // ── Discord gateway + interaction handler ─────────────────────────────────
    self
      .scheduler
      .spawn(discord_bot_service(alert_registry.clone(), status_tx.clone(), shutdown_notifier));

    // ── Axum HTTP + WebSocket server ──────────────────────────────────────────
    let app_state = AppState {
      config: crate::config::DiscordConfig::from_env(),
      registry: alert_registry,
      status_tx,
    };

    let app = router(app_state);
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
