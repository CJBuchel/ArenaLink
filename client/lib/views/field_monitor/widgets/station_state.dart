import 'package:flutter/material.dart';
import 'package:arena_link/models/arena_status.dart';
import 'package:arena_link/views/field_monitor/widgets/conn_pill.dart';

// ─── Battery voltage thresholds ───────────────────────────────────────────────

const double battCriticalV = 10.9;
const double battWarningV = 11.4;
const double battOkV = 12.0;

// ─── Ping thresholds ──────────────────────────────────────────────────────────

const int pingOkMs = 10;
const int pingWarnMs = 50;

// ─── Issue tracking (placeholder – no backend yet) ────────────────────────────

enum IssueStatus { none, flagged, inProgress, resolved }

IssueStatus demoIssue(String key) => switch (key) {
  'R1' => IssueStatus.flagged,
  'R2' => IssueStatus.inProgress,
  'B1' => IssueStatus.resolved,
  _ => IssueStatus.none,
};

// ─── Alert severity ───────────────────────────────────────────────────────────

enum StationSeverity { none, warning, critical }

// ─── Alliance color mode ──────────────────────────────────────────────────────
// active = full red/blue  (robot running/ready/batt issue)
// dim    = muted grey     (estop/astop/connection problems)
// off    = neutral grey   (bypassed)

enum AllianceMode { active, dim, off }

// ─── State display record ─────────────────────────────────────────────────────

typedef StateDisplay = ({
  String label,
  List<String> subs,
  Color color,
  StationSeverity severity,
  AllianceMode allianceMode,
});

// ─── State computation ────────────────────────────────────────────────────────

List<String> _radioSubs(WifiStatus wifi, DriverStationConnection ds) {
  final result = <String>[];
  final ping = ds.dsRobotTripTimeMs;
  if (ping > 0) result.add('${ping}ms');
  if (wifi.signalNoiseRatio > 0)
    result.add('SNR ${wifi.signalNoiseRatio.round()}dB');
  if (wifi.connectionQuality > 0) result.add('Q${wifi.connectionQuality}%');
  if (ds.missedPacketCount > 0) result.add('${ds.missedPacketCount} lost');
  return result;
}

StateDisplay computeStationState(AllianceStation station, int matchState) {
  if (station.eStop) {
    return (
      label: 'E-STOP',
      subs: const [],
      color: const Color(0xFFE24B4A),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (station.aStop) {
    return (
      label: 'A-STOP',
      subs: const [],
      color: const Color(0xFFEF9F27),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (station.bypass) {
    return (
      label: 'BYPASS',
      subs: const [],
      color: const Color(0xFF888780),
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.off,
    );
  }
  if (!station.ethernet) {
    return (
      label: 'NO ETH',
      subs: const [],
      color: const Color(0xFFE24B4A),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  final ds = station.dsConn;
  if (ds == null || !ds.dsLinked) {
    return (
      label: 'DS',
      subs: const [],
      color: const Color(0xFFE24B4A),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!station.wifiStatus.radioLinked && !ds.radioLinked) {
    return (
      label: 'RADIO',
      subs: _radioSubs(station.wifiStatus, ds),
      color: const Color(0xFFEF9F27),
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!ds.rioLinked) {
    return (
      label: 'RIO',
      subs: const [],
      color: const Color(0xFFE24B4A),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!ds.robotLinked) {
    return (
      label: 'CODE',
      subs: const [],
      color: const Color(0xFFEF9F27),
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.dim,
    );
  }
  final batt = ds.batteryVoltage;
  if (batt > 0 && batt < battCriticalV) {
    return (
      label: 'BATT',
      subs: ['${batt.toStringAsFixed(1)}v'],
      color: const Color(0xFFE24B4A),
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.active,
    );
  }
  if (batt > 0 && batt < battWarningV) {
    return (
      label: 'BATT',
      subs: ['${batt.toStringAsFixed(1)}v'],
      color: const Color(0xFFEF9F27),
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.active,
    );
  }
  return switch (matchState) {
    3 => (
      label: 'AUTO',
      subs: const [],
      color: const Color(0xFF2870C2),
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    4 => (
      label: 'PAUSE',
      subs: const [],
      color: const Color(0xFFEF9F27),
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    5 => (
      label: 'TELEOP',
      subs: const [],
      color: const Color(0xFF1A8C64),
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    6 || 7 => (
      label: 'DONE',
      subs: const [],
      color: const Color(0xFF555E68),
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    _ => (
      label: 'READY',
      subs: const [],
      color: const Color(0xFF1A8C64),
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
  };
}

// ─── Connection status helpers ────────────────────────────────────────────────

ConnStatus dsConnStatus(AllianceStation s) {
  final ds = s.dsConn;
  if (ds == null) return ConnStatus.none;
  return ds.dsLinked ? ConnStatus.ok : ConnStatus.error;
}

ConnStatus radioConnStatus(AllianceStation s) {
  if (s.wifiStatus.radioLinked) return ConnStatus.ok;
  if (s.dsConn?.radioLinked == true) return ConnStatus.degraded;
  return ConnStatus.none;
}

ConnStatus codeConnStatus(AllianceStation s) {
  final ds = s.dsConn;
  if (ds == null || !ds.dsLinked) return ConnStatus.none;
  return ds.robotLinked ? ConnStatus.ok : ConnStatus.error;
}

ConnStatus battConnStatus(AllianceStation s) {
  final v = s.dsConn?.batteryVoltage;
  if (v == null || v == 0) return ConnStatus.none;
  if (v < battCriticalV) return ConnStatus.error;
  if (v < battWarningV) return ConnStatus.degraded;
  return ConnStatus.ok;
}

ConnStatus pingConnStatus(int? ms) {
  if (ms == null) return ConnStatus.none;
  if (ms <= pingOkMs) return ConnStatus.ok;
  if (ms <= pingWarnMs) return ConnStatus.degraded;
  return ConnStatus.error;
}
