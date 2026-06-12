use std::net::IpAddr;

use clap::Parser;

use crate::modules::discord::types::AlertRecipient;

// ─── Server config (CLI + env) ────────────────────────────────────────────────
//
// Priority (highest → lowest):
//   1. CLI flag                (--port 8080)
//   2. Environment variable    (SERVER_PORT=8080)
//   3. Config file value       (.env or --config path)
//   4. Built-in default
//
// dotenvy loads the config file into environment variables before clap runs,
// so clap's `env = "..."` attributes naturally pick up file values while still
// letting real env vars and CLI flags override them.

#[derive(Parser, Debug, Clone)]
#[command(version, about, long_about = None)]
pub struct ServerConfig {
  /// Config file to load (dotenv format). Values are overridden by real env
  /// vars and CLI flags. Defaults to `.env` in the working directory.
  #[arg(short = 'c', long, default_value = ".env", env = "ARENALINK_CONFIG")]
  pub config_file: String,

  /// IP address to bind the HTTP API server on.
  #[arg(short, long, default_value = "0.0.0.0", env = "SERVER_ADDR")]
  pub addr: IpAddr,

  /// TCP port for the HTTP API server.
  #[arg(short, long, default_value = "9090", env = "SERVER_PORT")]
  pub port: u16,
}

/// Try to load a dotenv-format file at `path` into the environment.
/// Returns true if the file was found and loaded (even partially).
/// Non-overriding: existing env vars are never replaced.
fn load_config_file(path: &str) -> bool {
  match dotenvy::from_filename(path) {
    Ok(resolved) => {
      log::info!("Loaded config from {}", resolved.display());
      true
    }
    Err(dotenvy::Error::Io(e)) if e.kind() == std::io::ErrorKind::NotFound => false,
    Err(e) => {
      log::warn!("Could not parse config file '{path}': {e}");
      false
    }
  }
}

impl ServerConfig {
  /// Parse CLI args, then load the config file (if it exists) so that
  /// `DiscordConfig::from_env()` and any other `std::env::var()` callers
  /// pick up the file values — without overriding vars already set in the
  /// real environment.
  ///
  /// Load order:
  ///   1. Pre-parse CLI to find `--config` / `ARENALINK_CONFIG`.
  ///   2. Load that file with dotenvy (skips vars already in the environment).
  ///   3. Full clap parse — CLI flags override everything.
  pub fn load() -> Self {
    // ── Step 1: find the config file path from raw args / env ────────────────
    // We do a best-effort scan before the real clap parse so we know which
    // file to load. Errors here are silently ignored — clap will surface them
    // properly in the full parse below.
    let config_path = {
      let mut args = std::env::args().peekable();
      let mut found: Option<String> = None;

      while let Some(arg) = args.next() {
        if arg == "--config" || arg == "-c" {
          found = args.next();
          break;
        }
        if let Some(val) = arg.strip_prefix("--config=") {
          found = Some(val.to_string());
          break;
        }
        if let Some(val) = arg.strip_prefix("-c=") {
          found = Some(val.to_string());
          break;
        }
      }

      found
        .or_else(|| std::env::var("ARENALINK_CONFIG").ok())
        .unwrap_or_else(|| ".env".to_string())
    };

    // ── Step 2: load config file into the environment (non-overriding) ───────
    let loaded = load_config_file(&config_path);
    if !loaded {
      let cwd = std::env::current_dir()
        .map(|p| p.display().to_string())
        .unwrap_or_else(|_| "<unknown>".to_string());

      if config_path != ".env" {
        // User explicitly specified a file — warn that it's missing.
        log::warn!("Config file not found: '{config_path}' (cwd: {cwd})");
      } else {
        // Default path — silently try a few fallback locations before giving up.
        let fallbacks = ["server/.env", "server/.env.example", ".env.example"];
        let mut found = false;
        for fb in fallbacks {
          if load_config_file(fb) {
            found = true;
            break;
          }
        }
        if !found {
          log::debug!(
            "No .env found in '{cwd}' or 'server/' — \
             copy server/.env.example to server/.env and run from the workspace root, \
             or use --config <path>"
          );
        }
      }
    }

    // ── Step 3: full clap parse (CLI flags win over everything) ──────────────
    Self::parse()
  }
}

// ─── Discord configuration ────────────────────────────────────────────────────
// All values come from environment variables (populated either from the shell
// environment or from the config file loaded by ServerConfig::load()).
//
// ── Required ──────────────────────────────────────────────────────────────────
//   DISCORD_BOT_TOKEN              Bot token from the Discord developer portal
//   DISCORD_PIT_ALERTS_CHANNEL_ID  Numeric channel ID where alerts are posted
//
// ── Optional ──────────────────────────────────────────────────────────────────
//   DISCORD_ENABLED   "true" / "1" (default: true when bot token is present)
//   DISCORD_GUILD_ID  Numeric guild / server ID
//
// ── Role IDs (numeric, NOT role names) ───────────────────────────────────────
// Set these to enable @-mentions for each recipient type. The value must be
// the Discord role's numeric snowflake ID, e.g.:
//
//   DISCORD_ROLE_FTA=123456789012345678
//
// To find a role ID: Discord → Server Settings → Roles → right-click → Copy ID
// (Developer Mode must be enabled in Discord settings.)
//
//   DISCORD_ROLE_FTA        Field Technical Advisor
//   DISCORD_ROLE_FTAA       FTA Advisor / Assistant
//   DISCORD_ROLE_CSA        Control System Advisor
//   DISCORD_ROLE_INSPECTOR  Robot Inspector
//   DISCORD_ROLE_REFEREE    Head Referee
//   DISCORD_ROLE_LRI        Lead Robot Inspector

#[derive(Debug, Clone, Default)]
pub struct DiscordConfig {
  pub enabled: bool,
  pub bot_token: String,
  pub pit_alerts_channel_id: u64,
  pub guild_id: u64,

  // Role IDs — 0 means "not configured / don't ping"
  pub role_fta: u64,
  pub role_ftaa: u64,
  pub role_csa: u64,
  pub role_inspector: u64,
  pub role_referee: u64,
  pub role_lri: u64,
}

fn parse_u64_env(key: &str) -> u64 {
  std::env::var(key).ok().and_then(|v| v.parse().ok()).unwrap_or(0)
}

impl DiscordConfig {
  pub fn from_env() -> Self {
    let bot_token = std::env::var("DISCORD_BOT_TOKEN").unwrap_or_default();
    let enabled = !bot_token.is_empty()
      && std::env::var("DISCORD_ENABLED").map_or(true, |v| v == "true" || v == "1");

    Self {
      enabled,
      bot_token,
      pit_alerts_channel_id: parse_u64_env("DISCORD_PIT_ALERTS_CHANNEL_ID"),
      guild_id: parse_u64_env("DISCORD_GUILD_ID"),
      role_fta: parse_u64_env("DISCORD_ROLE_FTA"),
      role_ftaa: parse_u64_env("DISCORD_ROLE_FTAA"),
      role_csa: parse_u64_env("DISCORD_ROLE_CSA"),
      role_inspector: parse_u64_env("DISCORD_ROLE_INSPECTOR"),
      role_referee: parse_u64_env("DISCORD_ROLE_REFEREE"),
      role_lri: parse_u64_env("DISCORD_ROLE_LRI"),
    }
  }

  /// Format a single recipient as a Discord role mention, or None if not configured.
  pub fn role_mention(&self, recipient: &AlertRecipient) -> Option<String> {
    let id = match recipient {
      AlertRecipient::Fta => self.role_fta,
      AlertRecipient::Ftaa => self.role_ftaa,
      AlertRecipient::Csa => self.role_csa,
      AlertRecipient::Inspector => self.role_inspector,
      AlertRecipient::Referee => self.role_referee,
      AlertRecipient::Lri => self.role_lri,
    };
    if id == 0 { None } else { Some(format!("<@&{id}>")) }
  }

  /// Build the mention string for a list of recipients, e.g. "<@&123> <@&456>".
  /// Only includes roles that are actually configured with a valid role ID.
  /// If a recipient has no configured role ID, they are silently skipped —
  /// set the corresponding DISCORD_ROLE_* variable to enable pinging.
  pub fn build_mentions(&self, recipients: &[AlertRecipient]) -> String {
    recipients.iter().filter_map(|r| self.role_mention(r)).collect::<Vec<_>>().join(" ")
  }
}
