use anyhow::Result;

use crate::{db::get_table, models::PitAlertRecord};

const TABLE: &str = "pit_alerts";

pub struct AlertRepository;

impl AlertRepository {
  /// Persist a new alert. The key is the Discord message snowflake ID (as a string).
  /// Idempotent — calling again with the same ID overwrites the record.
  pub fn save(discord_msg_id: u64, record: &PitAlertRecord) -> Result<()> {
    let table = get_table(TABLE)?;
    let key = discord_msg_id.to_string();
    let indexes: Vec<String> = record
      .team_id
      .map(|id| vec![format!("team:{id}")])
      .unwrap_or_default();
    table.insert(&key, record, &indexes)
  }

  /// Update the `status` and `action_by` fields of an existing alert.
  pub fn update_status(discord_msg_id: u64, status: &str, action_by: Option<&str>) -> Result<()> {
    let table = get_table(TABLE)?;
    let key = discord_msg_id.to_string();
    let mut record: PitAlertRecord = table
      .get(&key)?
      .ok_or_else(|| anyhow::anyhow!("Alert {discord_msg_id} not found in database"))?;
    record.status = status.to_string();
    record.action_by = action_by.map(|s| s.to_string());
    table.update(&key, &record)?;
    Ok(())
  }

  /// Fetch a single alert by its Discord message ID.
  pub fn get(discord_msg_id: u64) -> Result<Option<PitAlertRecord>> {
    get_table(TABLE)?.get(&discord_msg_id.to_string())
  }

  /// Fetch all alerts for a team, sorted by creation time (oldest first).
  pub fn get_for_team(team_id: i32) -> Result<Vec<(String, PitAlertRecord)>> {
    let mut records = get_table(TABLE)?.get_by_index::<PitAlertRecord>(&format!("team:{team_id}"))?;
    records.sort_by_key(|(_, r)| r.created_at);
    Ok(records)
  }

  /// Fetch every alert in the database. Used on bot startup for state recovery.
  pub fn get_all() -> Result<Vec<(String, PitAlertRecord)>> {
    get_table(TABLE)?.scan_all()
  }
}
