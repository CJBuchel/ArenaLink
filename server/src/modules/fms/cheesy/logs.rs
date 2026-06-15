// ─── Cheesy Arena log fetching & CSV parsing ──────────────────────────────────
//
// All Cheesy Arena–specific knowledge about log files lives here:
//   - File naming convention: {YYYYMMDDHHMMSS}_{Type}_Match_{ShortName}_{TeamId}.csv
//   - Log directory:          GET {fms_base_url}/static/logs/  (HTML directory listing)
//   - CSV column names:       matchTimeSec, batteryVoltage, rxRate, txRate, …
//
// The output type is the generic ArenaLink MatchLogEntry — no Cheesy types leak out.

use std::time::Duration;

use crate::modules::fms::models::MatchLogEntry;

/// Fetch and parse the most-recent log for `match_short_name` + `team_id`.
/// Returns an empty Vec if no matching file is found.
pub async fn fetch_logs(
  base_url:         &str,
  match_short_name: &str,
  team_id:          u32,
) -> anyhow::Result<Vec<MatchLogEntry>> {
  let Some(filename) = find_log_file(base_url, match_short_name, team_id).await? else {
    log::debug!("[FMS/Cheesy/logs] No log file found for {match_short_name}/{team_id}");
    return Ok(Vec::new());
  };

  log::debug!("[FMS/Cheesy/logs] Fetching {filename}");

  let url = format!("{base_url}/static/logs/{filename}");
  let client = reqwest::Client::builder().timeout(Duration::from_secs(10)).build()?;
  let csv = client.get(&url).send().await?.text().await?;

  Ok(parse_cheesy_csv(&csv))
}

// ─── File lookup ──────────────────────────────────────────────────────────────
//
// Cheesy Arena names logs: {timestamp}_{Type}_Match_{shortName}_{teamId}.csv
// Multiple files may exist for the same match (replays). We pick the last one
// alphabetically since the timestamp prefix sorts chronologically.

async fn find_log_file(
  base_url:         &str,
  match_short_name: &str,
  team_id:          u32,
) -> anyhow::Result<Option<String>> {
  let url = format!("{base_url}/static/logs/");
  let client = reqwest::Client::builder().timeout(Duration::from_secs(8)).build()?;

  let body = match client.get(&url).send().await {
    Ok(r) if r.status().is_success() => r.text().await?,
    Ok(r) => {
      log::debug!("[FMS/Cheesy/logs] Directory listing returned {}", r.status());
      return Ok(None);
    }
    Err(e) => {
      log::debug!("[FMS/Cheesy/logs] Could not reach FMS log directory: {e}");
      return Ok(None);
    }
  };

  let re = regex::Regex::new(r#"href="([^"]+\.csv)""#).unwrap();
  let suffix = format!("_Match_{}_{}.csv", match_short_name, team_id);

  let mut candidates: Vec<String> = re
    .captures_iter(&body)
    .filter_map(|c| c.get(1).map(|m| m.as_str().to_string()))
    .filter(|f| f.ends_with(&suffix))
    .collect();

  if candidates.is_empty() {
    return Ok(None);
  }
  candidates.sort();
  Ok(candidates.into_iter().last())
}

// ─── CSV parser ───────────────────────────────────────────────────────────────
//
// Cheesy Arena CSV column names (lowercased for matching):
//   matchtimesec, auto, enabled, dsauto, dsenabled, batteryvoltage,
//   rxrate, txrate, missedpacketcount, dslinked, radiolinked, riolinked,
//   robotlinked, ethernetlinked

fn parse_cheesy_csv(body: &str) -> Vec<MatchLogEntry> {
  let mut lines = body.lines();

  let Some(header_line) = lines.next() else { return Vec::new(); };
  let header: Vec<String> = header_line
    .split(',')
    .map(|h| h.trim().to_lowercase())
    .collect();

  let col = |name: &str| header.iter().position(|h| h == name);

  let i_time    = col("matchtimesec");
  let i_auto    = col("auto");
  let i_enabled = col("enabled");
  let i_ds_auto = col("dsauto");
  let i_ds_en   = col("dsenabled");
  let i_volts   = col("batteryvoltage");
  let i_rx      = col("rxrate");
  let i_tx      = col("txrate");
  let i_loss    = col("missedpacketcount");
  let i_ds      = col("dslinked");
  let i_radio   = col("radiolinked");
  let i_rio     = col("riolinked");
  let i_robot   = col("robotlinked");
  let i_eth     = col("ethernetlinked");

  let mut entries = Vec::new();

  for line in lines {
    let parts: Vec<&str> = line.split(',').collect();
    if parts.len() < header.len() { continue; }

    let gf = |idx: Option<usize>| -> f64 {
      idx
        .and_then(|i| parts.get(i))
        .and_then(|v| v.trim().parse().ok())
        .unwrap_or(0.0)
    };

    let gb = |idx: Option<usize>| -> bool {
      idx
        .and_then(|i| parts.get(i))
        .map(|v| { let v = v.trim().to_lowercase(); v == "true" || v == "1" })
        .unwrap_or(false)
    };

    entries.push(MatchLogEntry {
      match_time_sec:  gf(i_time),
      auto:            gb(i_auto),
      enabled:         gb(i_enabled),
      ds_auto:         gb(i_ds_auto),
      ds_enabled:      gb(i_ds_en),
      battery_voltage: gf(i_volts),
      rx_rate_mbps:    gf(i_rx),
      tx_rate_mbps:    gf(i_tx),
      missed_packets:  gf(i_loss) as i32,
      ds_linked:       gb(i_ds),
      radio_linked:    gb(i_radio),
      rio_linked:      gb(i_rio),
      robot_linked:    gb(i_robot),
      ethernet_linked: gb(i_eth),
    });
  }

  log::debug!("[FMS/Cheesy/logs] Parsed {} rows", entries.len());
  entries
}
