use std::net::SocketAddr;

use anyhow::Result;
use axum::Router;
use tower_http::{
  cors::{Any, CorsLayer},
  services::{ServeDir, ServeFile},
};

use crate::core::shutdown::ShutdownNotifier;

pub async fn serve_web(addr: SocketAddr, web_dir: String) -> Result<()> {
  let mut shutdown_rx = ShutdownNotifier::get().subscribe();

  let cors = CorsLayer::new()
    .allow_origin(Any)
    .allow_headers(Any)
    .allow_methods(Any);

  let serve = ServeDir::new(&web_dir)
    .fallback(ServeFile::new(format!("{web_dir}/index.html")));

  let app = Router::new()
    .fallback_service(serve)
    .layer(cors);

  let listener = tokio::net::TcpListener::bind(addr).await?;
  log::info!("Web server listening on http://{addr} (serving '{web_dir}')");

  axum::serve(listener, app)
    .with_graceful_shutdown(async move {
      shutdown_rx.recv().await.ok();
      log::info!("Web server shutting down");
    })
    .await?;

  Ok(())
}
