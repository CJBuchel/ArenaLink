use std::sync::OnceLock;

use anyhow::Result;

use crate::table::Table;

static DB: OnceLock<sled::Db> = OnceLock::new();

/// Open the sled database at `path` and make it globally available.
/// Call once at server startup before any repository operations.
pub fn init_db(path: &str) -> Result<()> {
  let db = sled::open(path)?;
  DB.set(db).map_err(|_| anyhow::anyhow!("Database already initialized"))?;
  log::info!("Database opened at '{path}'");
  Ok(())
}

/// Get a table handle. Fails if `init_db` has not been called.
pub(crate) fn get_table(name: &str) -> Result<Table> {
  DB.get()
    .map(|db| Table::new(db.clone(), name))
    .ok_or_else(|| anyhow::anyhow!("Database not initialized — call init_db first"))
}
