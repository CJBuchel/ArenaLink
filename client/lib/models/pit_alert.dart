import 'package:flutter/material.dart';
import 'package:arena_link/models/arena_state.dart' show EventTeam, FieldMonitorState, StationStatus;

// ─── Alert type ───────────────────────────────────────────────────────────────

enum AlertGroup { robot, inspection, support, general }

enum PitAlertType {
  // ── Robot / Electronics ──────────────────────────────────────────────────
  battery,
  rio,
  code,
  radio,
  noDs,
  eStop,
  // ── Inspection / Mechanical ──────────────────────────────────────────────
  mechanical,
  reinspect,
  electrical,
  // ── Support ──────────────────────────────────────────────────────────────
  csa,
  inspector,
  // ── General ──────────────────────────────────────────────────────────────
  custom,
}

extension PitAlertTypeX on PitAlertType {
  String get label => switch (this) {
    PitAlertType.battery    => 'BATTERY',
    PitAlertType.rio        => 'RIO',
    PitAlertType.code       => 'CODE',
    PitAlertType.radio      => 'RADIO',
    PitAlertType.noDs       => 'NO DS',
    PitAlertType.eStop      => 'E-STOP',
    PitAlertType.mechanical => 'MECHANICAL',
    PitAlertType.reinspect  => 'REINSPECT',
    PitAlertType.electrical => 'ELECTRICAL',
    PitAlertType.csa        => 'CSA',
    PitAlertType.inspector  => 'INSPECTOR',
    PitAlertType.custom     => 'CUSTOM',
  };

  IconData get icon => switch (this) {
    PitAlertType.battery    => Icons.battery_alert_rounded,
    PitAlertType.rio        => Icons.developer_board_rounded,
    PitAlertType.code       => Icons.code_rounded,
    PitAlertType.radio      => Icons.wifi_rounded,
    PitAlertType.noDs       => Icons.laptop_rounded,
    PitAlertType.eStop      => Icons.stop_circle_rounded,
    PitAlertType.mechanical => Icons.build_rounded,
    PitAlertType.reinspect  => Icons.fact_check_rounded,
    PitAlertType.electrical => Icons.electrical_services_rounded,
    PitAlertType.csa        => Icons.support_agent_rounded,
    PitAlertType.inspector  => Icons.search_rounded,
    PitAlertType.custom     => Icons.edit_note_rounded,
  };

  String get emoji => switch (this) {
    PitAlertType.battery    => '🔋',
    PitAlertType.rio        => '🖥️',
    PitAlertType.code       => '💻',
    PitAlertType.radio      => '📡',
    PitAlertType.noDs       => '🖱️',
    PitAlertType.eStop      => '🛑',
    PitAlertType.mechanical => '🔩',
    PitAlertType.reinspect  => '⚖️',
    PitAlertType.electrical => '⚡',
    PitAlertType.csa        => '👷',
    PitAlertType.inspector  => '🔍',
    PitAlertType.custom     => '📋',
  };

  String get description => switch (this) {
    PitAlertType.battery    => 'Battery voltage issue detected',
    PitAlertType.rio        => 'RoboRIO not connecting or unresponsive',
    PitAlertType.code       => 'Robot code not running or crashed',
    PitAlertType.radio      => 'Radio not linking to access point',
    PitAlertType.noDs       => 'Driver Station not connecting to robot',
    PitAlertType.eStop      => 'Emergency stop was triggered',
    PitAlertType.mechanical => 'Mechanical damage or modification',
    PitAlertType.reinspect  => 'Robot needs reinspection',
    PitAlertType.electrical => 'Electrical wiring issue',
    PitAlertType.csa        => 'Control System Advisor assistance needed',
    PitAlertType.inspector  => 'Robot Inspector assistance needed',
    PitAlertType.custom     => 'Custom / other issue',
  };

  AlertGroup get group => switch (this) {
    PitAlertType.battery ||
    PitAlertType.rio     ||
    PitAlertType.code    ||
    PitAlertType.radio   ||
    PitAlertType.noDs    ||
    PitAlertType.eStop   => AlertGroup.robot,
    PitAlertType.mechanical ||
    PitAlertType.reinspect  ||
    PitAlertType.electrical => AlertGroup.inspection,
    PitAlertType.csa      ||
    PitAlertType.inspector => AlertGroup.support,
    PitAlertType.custom    => AlertGroup.general,
  };

  /// Suggested recipients shown as a hint — not auto-selected.
  /// Used for reference only (defaultRecipients is no longer auto-applied).
  List<AlertRecipient> get defaultRecipients => switch (this) {
    PitAlertType.battery ||
    PitAlertType.rio     ||
    PitAlertType.code    ||
    PitAlertType.noDs    => [AlertRecipient.ftaa],
    PitAlertType.radio   => [AlertRecipient.ftaa, AlertRecipient.csa],
    PitAlertType.eStop   => [AlertRecipient.fta, AlertRecipient.ftaa],
    PitAlertType.mechanical  => [AlertRecipient.inspector],
    PitAlertType.reinspect   => [AlertRecipient.inspector, AlertRecipient.lri],
    PitAlertType.electrical  => [AlertRecipient.inspector, AlertRecipient.csa],
    PitAlertType.csa         => [AlertRecipient.csa],
    PitAlertType.inspector   => [AlertRecipient.inspector],
    PitAlertType.custom      => [],
  };

  /// Specific problem options for this alert type.
  /// Shown as multi-select chips in the dialog so users can describe the
  /// issue without having to type notes. Empty for custom (use notes).
  List<String> get subIssues => switch (this) {
    PitAlertType.battery => [
      'Low voltage (< 12v)',
      'Intermittent disconnects',
      'Brownout / power cycling',
      "Won't hold charge",
      'Needs replacement',
    ],
    PitAlertType.rio => [
      'Not connecting to DS',
      'Rebooting repeatedly',
      'Incompatible image / version',
      'Hardware failure',
    ],
    PitAlertType.code => [
      'No code / not deployed',
      'Crashed during match',
      'Deploy failed',
      'Runtime exception',
    ],
    PitAlertType.radio => [
      'Not linking to AP',
      'Intermittent signal drops',
      'Wrong SSID / channel',
      'Hardware issue',
    ],
    PitAlertType.noDs => [
      'DS not connecting to robot',
      'DS software crash',
      'Network / IP misconfiguration',
      'USB tether only',
    ],
    PitAlertType.eStop => [
      'Driver-side e-stop',
      'Field-side e-stop',
      'Accidental trigger',
      'Safety concern',
    ],
    PitAlertType.mechanical => [
      'Structural damage',
      'Mechanism jammed',
      'Part fell off / detached',
      'Needs field repair',
    ],
    PitAlertType.reinspect => [
      'Weight / size change',
      'Hardware modification made',
      'After field repair',
      'Bumper / number issue',
    ],
    PitAlertType.electrical => [
      'Wiring issue',
      'Breaker tripped / blown',
      'Loose / disconnected wire',
      'Short circuit concern',
    ],
    PitAlertType.csa => [
      'Robot won\'t enable',
      'Control system configuration',
      'Network / radio setup',
      'Programming assistance',
    ],
    PitAlertType.inspector => [
      'Inspection required',
      'Re-weigh / re-measure',
      'Modification to inspect',
      'Rules clarification needed',
    ],
    PitAlertType.custom => [],
  };
}

// ─── Recipient ────────────────────────────────────────────────────────────────

enum AlertRecipient { fta, ftaa, csa, inspector, referee, lri }

extension AlertRecipientX on AlertRecipient {
  String get label => switch (this) {
    AlertRecipient.fta       => 'FTA',
    AlertRecipient.ftaa      => 'FTAA',
    AlertRecipient.csa       => 'CSA',
    AlertRecipient.inspector => 'Inspector',
    AlertRecipient.referee   => 'Referee',
    AlertRecipient.lri       => 'LRI',
  };

  String get description => switch (this) {
    AlertRecipient.fta       => 'Field Technical Advisor',
    AlertRecipient.ftaa      => 'FTA Advisor / Assistant',
    AlertRecipient.csa       => 'Control System Advisor',
    AlertRecipient.inspector => 'Robot Inspector',
    AlertRecipient.referee   => 'Head Referee',
    AlertRecipient.lri       => 'Lead Robot Inspector',
  };
}

// ─── Alert context ────────────────────────────────────────────────────────────
// A generic snapshot passed into the dialog — works from both the field monitor
// (with live telemetry) and the teams list (no live stats).

class PitAlertContext {
  final int? teamId;
  final String? teamName;
  final String? teamNickname;

  /// "R1", "B3" from field monitor — "Pit" from teams list.
  final String stationLabel;

  // Match context
  final String matchName;
  final String matchTypeLabel;
  final String matchStateLabel;
  final int? timeRemainingSec;
  final String? scheduledStart;

  // Live telemetry — null when not on field
  final double? batteryVoltage;
  final bool? rioLinked;
  final bool? codeRunning;
  final bool? radioLinked;
  final double? signalNoiseRatioDB;
  final int? connectionQualityPct;
  final int? tripTimeMs;
  final int? missedPackets;
  final bool? dsLinked;

  /// Snapshot of all stations' battery voltages for context.
  /// Key: station key ("R1" … "B3"), value: voltage or null if DS not linked.
  final Map<String, double?> allStationBatteries;

  const PitAlertContext({
    this.teamId,
    this.teamName,
    this.teamNickname,
    required this.stationLabel,
    this.matchName = '',
    this.matchTypeLabel = '',
    this.matchStateLabel = '',
    this.timeRemainingSec,
    this.scheduledStart,
    this.batteryVoltage,
    this.rioLinked,
    this.codeRunning,
    this.radioLinked,
    this.signalNoiseRatioDB,
    this.connectionQualityPct,
    this.tripTimeMs,
    this.missedPackets,
    this.dsLinked,
    this.allStationBatteries = const {},
  });

  /// Build from a live alliance station + current field state.
  factory PitAlertContext.fromStation({
    required String stationKey,
    required StationStatus station,
    required FieldMonitorState field,
  }) {
    final batteries = <String, double?>{
      for (final e in field.stations.entries)
        e.key: (e.value.dsLink?.batteryVoltage ?? 0) > 0
            ? e.value.dsLink!.batteryVoltage
            : null,
    };

    return PitAlertContext(
      teamId: station.teamId,
      teamName: station.teamName,
      teamNickname: station.teamNickname,
      stationLabel: stationKey,
      matchName: field.matchName,
      matchTypeLabel: _matchTypeLabel(field.matchType),
      matchStateLabel: _matchStateLabel(field.matchState),
      timeRemainingSec: field.timer.countdownSec,
      scheduledStart: field.scheduledStart != null
          ? _formatScheduled(field.scheduledStart!)
          : null,
      batteryVoltage: (station.dsLink?.batteryVoltage ?? 0) > 0
          ? station.dsLink!.batteryVoltage
          : null,
      rioLinked: station.dsLink?.rioLinked,
      codeRunning: station.dsLink?.codeRunning,
      radioLinked:
          station.radioLink.linked || (station.dsLink?.radioLinked ?? false),
      signalNoiseRatioDB: station.radioLink.signalNoiseRatio > 0
          ? station.radioLink.signalNoiseRatio
          : null,
      connectionQualityPct: station.radioLink.connectionQuality > 0
          ? station.radioLink.connectionQuality
          : null,
      tripTimeMs: (station.dsLink?.tripTimeMs ?? 0) > 0
          ? station.dsLink!.tripTimeMs
          : null,
      missedPackets: station.dsLink?.missedPackets,
      dsLinked: station.dsLink?.dsLinked,
      allStationBatteries: batteries,
    );
  }

  /// Build from a team in the teams list (no live telemetry).
  factory PitAlertContext.fromTeam({
    required EventTeam team,
    String matchName = '',
    String matchTypeLabel = '',
  }) {
    return PitAlertContext(
      teamId: team.id,
      teamName: team.name,
      teamNickname: team.nickname.isNotEmpty ? team.nickname : null,
      stationLabel: 'Pit',
      matchName: matchName,
      matchTypeLabel: matchTypeLabel,
      matchStateLabel: '',
    );
  }

  bool get hasLiveTelemetry =>
      batteryVoltage != null ||
      rioLinked != null ||
      radioLinked != null;

  String get teamDisplay {
    final name = teamNickname ?? teamName;
    if (teamId != null && name != null) return '$teamId — $name';
    if (teamId != null) return '$teamId';
    return 'Unknown Team';
  }
}

String _matchTypeLabel(int matchType) => switch (matchType) {
  0 => 'Test',
  1 => 'Practice',
  2 => 'Qualification',
  3 => 'Playoff',
  _ => '',
};

String _matchStateLabel(int matchState) => switch (matchState) {
  0 => 'Pre-Match',
  1 => 'Starting',
  2 => 'Autonomous',
  3 => 'Pause',
  4 => 'Teleop',
  5 => 'Post-Match',
  6 => 'Timeout',
  7 => 'Post-Timeout',
  _ => '',
};

String _formatScheduled(DateTime dt) {
  final h = dt.hour;
  final m = dt.minute.toString().padLeft(2, '0');
  final period = h >= 12 ? 'PM' : 'AM';
  final hour12 = h % 12 == 0 ? 12 : h % 12;
  return '$hour12:$m $period';
}

// ─── Submission ───────────────────────────────────────────────────────────────

/// What the dialog returns when the user presses Submit.
class PitAlertSubmission {
  final PitAlertContext context;
  final PitAlertType alertType;

  /// Specific problem descriptions selected by the user (from [PitAlertTypeX.subIssues]).
  /// Empty if the user relied solely on field notes.
  final List<String> subIssues;

  final List<AlertRecipient> recipients;
  final String? fieldNotes;

  const PitAlertSubmission({
    required this.context,
    required this.alertType,
    this.subIssues = const [],
    required this.recipients,
    this.fieldNotes,
  });
}
