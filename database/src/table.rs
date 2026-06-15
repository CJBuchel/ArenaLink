use anyhow::Result;
use serde::{Serialize, de::DeserializeOwned};

/// A named key-space within the sled database.
///
/// Key layout:
///   `{name}:data:{id}`        → JSON-encoded record
///   `{name}:idx:{index}:{id}` → `id` bytes  (search index)
pub struct Table {
  db: sled::Db,
  name: String,
}

impl Table {
  pub fn new(db: sled::Db, name: &str) -> Self {
    Self { db, name: name.to_string() }
  }

  fn data_key(&self, id: &str) -> String {
    format!("{}:data:{}", self.name, id)
  }

  fn index_key(&self, index: &str, id: &str) -> String {
    format!("{}:idx:{}:{}", self.name, index, id)
  }

  fn index_prefix(&self, index: &str) -> String {
    format!("{}:idx:{}:", self.name, index)
  }

  /// Insert a new record. Overwrites any existing record with the same `id`.
  /// `indexes` are additional lookup keys (e.g. `"team:3100"`).
  pub fn insert<T: Serialize>(&self, id: &str, value: &T, indexes: &[String]) -> Result<()> {
    let bytes = serde_json::to_vec(value)?;
    self.db.insert(self.data_key(id), bytes.as_slice())?;
    for index in indexes {
      self.db.insert(self.index_key(index, id), id.as_bytes())?;
    }
    self.db.flush()?;
    Ok(())
  }

  /// Update an existing record in-place (does not touch indexes).
  /// Returns `false` if the record does not exist.
  pub fn update<T: Serialize>(&self, id: &str, value: &T) -> Result<bool> {
    let key = self.data_key(id);
    if self.db.get(&key)?.is_none() {
      return Ok(false);
    }
    let bytes = serde_json::to_vec(value)?;
    self.db.insert(key, bytes.as_slice())?;
    self.db.flush()?;
    Ok(true)
  }

  /// Fetch a single record by its primary `id`.
  pub fn get<T: DeserializeOwned>(&self, id: &str) -> Result<Option<T>> {
    match self.db.get(self.data_key(id))? {
      Some(bytes) => Ok(Some(serde_json::from_slice(&bytes)?)),
      None => Ok(None),
    }
  }

  /// Fetch all records whose search index matches `index` (exact match).
  pub fn get_by_index<T: DeserializeOwned>(&self, index: &str) -> Result<Vec<(String, T)>> {
    let prefix = self.index_prefix(index);
    let mut results = Vec::new();
    for item in self.db.scan_prefix(prefix.as_bytes()) {
      let (key, _) = item?;
      let key_str = std::str::from_utf8(&key)?;
      if let Some(id) = key_str.strip_prefix(&prefix) {
        match self.get::<T>(id)? {
          Some(record) => results.push((id.to_string(), record)),
          None => log::warn!(
            "Dangling index entry for '{}' in table '{}' — skipping",
            id, self.name
          ),
        }
      }
    }
    Ok(results)
  }

  /// Scan and return every record in the table.
  pub fn scan_all<T: DeserializeOwned>(&self) -> Result<Vec<(String, T)>> {
    let prefix = format!("{}:data:", self.name);
    let mut results = Vec::new();
    for item in self.db.scan_prefix(prefix.as_bytes()) {
      let (key, val) = item?;
      let key_str = std::str::from_utf8(&key)?;
      if let Some(id) = key_str.strip_prefix(&prefix) {
        match serde_json::from_slice::<T>(&val) {
          Ok(record) => results.push((id.to_string(), record)),
          Err(e) => log::warn!(
            "Failed to deserialize record '{}' in table '{}': {e}",
            id, self.name
          ),
        }
      }
    }
    Ok(results)
  }
}
