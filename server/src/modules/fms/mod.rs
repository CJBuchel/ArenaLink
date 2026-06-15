pub mod cheesy;
pub mod models;

pub use models::{ArenaState, ArenaBroadcast, MatchLogEntry, new_arena_broadcast};

// ─── Log provider ─────────────────────────────────────────────────────────────
//
// Backend-dispatched log fetching. Adding a new FMS backend means adding a new
// variant here and implementing the fetch in its own module.

pub enum LogProvider {
  Cheesy(String), // fms_base_url, e.g. "http://localhost:8080"
}

impl LogProvider {
  pub fn cheesy(fms_host: &str, fms_port: u16) -> Self {
    Self::Cheesy(format!("http://{fms_host}:{fms_port}"))
  }

  pub async fn fetch_logs(
    &self,
    match_short_name: &str,
    team_id:          u32,
  ) -> anyhow::Result<Vec<models::MatchLogEntry>> {
    match self {
      Self::Cheesy(base_url) => cheesy::logs::fetch_logs(base_url, match_short_name, team_id).await,
    }
  }
}
