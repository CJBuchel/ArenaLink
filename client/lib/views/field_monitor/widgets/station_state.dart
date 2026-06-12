import 'package:flutter/material.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/views/field_monitor/widgets/conn_pill.dart';

// ─── Battery voltage thresholds ───────────────────────────────────────────────

typedef BattThresholds = ({double warning, double critical});

const BattThresholds battThresholdsIdle   = (warning: 11.8, critical: 11.0);
const BattThresholds battThresholdsActive = (warning: 10.5, critical: 9.8);

/// Returns the appropriate thresholds based on matchState.
/// Auto (2) and Teleop (4) are enabled periods drawing real current.
BattThresholds battThresholds(int matchState) =>
    (matchState == MatchStateConst.autoPeriod ||
            matchState == MatchStateConst.teleopPeriod)
        ? battThresholdsActive
        : battThresholdsIdle;

// ─── Ping thresholds ──────────────────────────────────────────────────────────

const int pingOkMs = 10;
const int pingWarnMs = 50;

// ─── Issue tracking ───────────────────────────────────────────────────────────

enum IssueStatus { none, flagged, inProgress, resolved }

// ─── Alert severity ───────────────────────────────────────────────────────────

enum StationSeverity { none, warning, critical }

// ─── Alliance color mode ──────────────────────────────────────────────────────

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

List<String> _radioSubs(RadioLink radio, DsLink ds) {
  final result = <String>[];
  if (ds.tripTimeMs > 0) result.add('${ds.tripTimeMs}ms');
  if (radio.signalNoiseRatio > 0) {
    result.add('SNR ${radio.signalNoiseRatio.round()}dB');
  }
  if (radio.connectionQuality > 0) result.add('Q${radio.connectionQuality}%');
  if (ds.missedPackets > 0) result.add('${ds.missedPackets} lost');
  return result;
}

StateDisplay computeStationState(StationStatus station, int matchState) {
  if (station.eStop) {
    return (
      label: 'E-STOP',
      subs: const [],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (station.aStop) {
    return (
      label: 'A-STOP',
      subs: const [],
      color: arenaAmber,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (station.bypass) {
    return (
      label: 'BYPASS',
      subs: const [],
      color: arenaGrey,
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.off,
    );
  }
  if (!station.ethernet) {
    return (
      label: 'NO ETH',
      subs: const [],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  final ds = station.dsLink;
  if (ds == null || !ds.dsLinked) {
    return (
      label: 'DS',
      subs: const [],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!station.radioLink.linked && !ds.radioLinked) {
    return (
      label: 'RADIO',
      subs: _radioSubs(station.radioLink, ds),
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!ds.rioLinked) {
    return (
      label: 'RIO',
      subs: const [],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  if (!ds.codeRunning) {
    return (
      label: 'CODE',
      subs: const [],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.dim,
    );
  }
  final batt = ds.batteryVoltage;
  final thresh = battThresholds(matchState);
  if (batt > 0 && batt < thresh.critical) {
    return (
      label: 'BATT',
      subs: ['${batt.toStringAsFixed(1)}v'],
      color: arenaRed,
      severity: StationSeverity.critical,
      allianceMode: AllianceMode.active,
    );
  }
  if (batt > 0 && batt < thresh.warning) {
    return (
      label: 'BATT',
      subs: ['${batt.toStringAsFixed(1)}v'],
      color: arenaAmber,
      severity: StationSeverity.warning,
      allianceMode: AllianceMode.active,
    );
  }
  return switch (matchState) {
    MatchStateConst.autoPeriod => (
      label: 'AUTO',
      subs: const [],
      color: phasePreBlue,
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    MatchStateConst.pausePeriod => (
      label: 'PAUSE',
      subs: const [],
      color: arenaAmber,
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    MatchStateConst.teleopPeriod => (
      label: 'TELEOP',
      subs: const [],
      color: phaseTeleopTeal,
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    MatchStateConst.postMatch ||
    MatchStateConst.timeoutActive ||
    MatchStateConst.postTimeout => (
      label: 'DONE',
      subs: const [],
      color: phaseDoneGrey,
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
    _ => (
      label: 'READY',
      subs: const [],
      color: phaseTeleopTeal,
      severity: StationSeverity.none,
      allianceMode: AllianceMode.active,
    ),
  };
}

// ─── Connection status helpers ────────────────────────────────────────────────

ConnStatus dsConnStatus(StationStatus s) {
  final ds = s.dsLink;
  if (ds == null) return ConnStatus.none;
  return ds.dsLinked ? ConnStatus.ok : ConnStatus.error;
}

ConnStatus radioConnStatus(StationStatus s) {
  if (s.radioLink.linked) return ConnStatus.ok;
  if (s.dsLink?.radioLinked == true) return ConnStatus.degraded;
  // If DS is linked we definitively know radio is down; otherwise no data.
  if (s.dsLink?.dsLinked == true) return ConnStatus.error;
  return ConnStatus.none;
}

ConnStatus codeConnStatus(StationStatus s) {
  final ds = s.dsLink;
  if (ds == null || !ds.dsLinked) return ConnStatus.none;
  return ds.codeRunning ? ConnStatus.ok : ConnStatus.error;
}

ConnStatus battConnStatus(StationStatus s, int matchState) {
  final v = s.dsLink?.batteryVoltage;
  if (v == null || v == 0) return ConnStatus.none;
  final thresh = battThresholds(matchState);
  if (v < thresh.critical) return ConnStatus.error;
  if (v < thresh.warning) return ConnStatus.degraded;
  return ConnStatus.ok;
}

ConnStatus pingConnStatus(int? ms) {
  if (ms == null) return ConnStatus.none;
  if (ms <= pingOkMs) return ConnStatus.ok;
  if (ms <= pingWarnMs) return ConnStatus.degraded;
  return ConnStatus.error;
}
