#!/usr/bin/env bash
set -euo pipefail

# Resolve the absolute path to the project root (wherever this script lives).
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BINARY="$PROJECT_DIR/target/release/arenalink"
WEB_DIR="$PROJECT_DIR/client/build/web"
SERVICE_NAME="arenalink"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

echo "=== ArenaLink service installer ==="
echo "Project root : $PROJECT_DIR"
echo ""

# ── Pre-flight checks ────────────────────────────────────────────────────────

if [[ $EUID -ne 0 ]]; then
  echo "Error: this script must be run as root (use sudo)."
  exit 1
fi

if [[ ! -f "$BINARY" ]]; then
  echo "Error: server binary not found at:"
  echo "  $BINARY"
  echo ""
  echo "Build it first from the project root:"
  echo "  cargo build --release"
  exit 1
fi

if [[ ! -d "$WEB_DIR" ]]; then
  echo "Warning: Flutter web build not found at:"
  echo "  $WEB_DIR"
  echo ""
  echo "The server will start but won't serve the web UI."
  echo "Build it with:"
  echo "  cd client && flutter build web --release"
  echo ""
fi

# ── Write service file ───────────────────────────────────────────────────────

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=ArenaLink Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$PROJECT_DIR
ExecStart=$BINARY
Restart=always
RestartSec=3
StandardOutput=journal
StandardError=journal
StartLimitIntervalSec=0
StartLimitBurst=0

[Install]
WantedBy=multi-user.target
EOF

echo "Service file written to : $SERVICE_FILE"

# ── Enable and start ─────────────────────────────────────────────────────────

systemctl daemon-reload
systemctl enable "$SERVICE_NAME"
systemctl restart "$SERVICE_NAME"

echo ""
echo "ArenaLink is running."
echo ""
echo "  Status : systemctl status $SERVICE_NAME"
echo "  Logs   : journalctl -u $SERVICE_NAME -f"
echo "  Stop   : systemctl stop $SERVICE_NAME"
echo "  Restart: systemctl restart $SERVICE_NAME"
