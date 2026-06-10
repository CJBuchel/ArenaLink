import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ─── Stub enums & models (replace with real providers later) ──────────────────

enum MatchPhase {
  preMatch,
  configured,
  ready,
  auto,
  pause,
  teleop,
  over,
  postMatch,
  award,
}

extension MatchPhaseLabel on MatchPhase {
  String get label => switch (this) {
    MatchPhase.preMatch => 'Pre-Match',
    MatchPhase.configured => 'Configured',
    MatchPhase.ready => 'Ready',
    MatchPhase.auto => 'Auto',
    MatchPhase.pause => 'Pause',
    MatchPhase.teleop => 'Teleop',
    MatchPhase.over => 'Over',
    MatchPhase.postMatch => 'Post-Match',
    MatchPhase.award => 'Award',
  };
}

enum ConnectionState2 { ok, degraded, error, none }

enum FieldDeviceState { run, ready, fault, offline, auto }

extension FieldDeviceStateLabel on FieldDeviceState {
  String get label => switch (this) {
    FieldDeviceState.run => 'Run',
    FieldDeviceState.ready => 'Ready',
    FieldDeviceState.fault => 'Fault',
    FieldDeviceState.offline => 'Offline',
    FieldDeviceState.auto => 'Auto',
  };
}

class RobotStation {
  final int teamNumber;
  final ConnectionState2 ds;
  final ConnectionState2 radio;
  final ConnectionState2 rio;
  final ConnectionState2 code;
  final double? batteryVoltage;
  final bool eStopped;
  final bool bypassed;

  const RobotStation({
    required this.teamNumber,
    this.ds = ConnectionState2.none,
    this.radio = ConnectionState2.none,
    this.rio = ConnectionState2.none,
    this.code = ConnectionState2.none,
    this.batteryVoltage,
    this.eStopped = false,
    this.bypassed = false,
  });
}

class FieldElectronicsState {
  final FieldDeviceState sccRed;
  final FieldDeviceState sccBlue;
  final FieldDeviceState fieldNetwork;
  final FieldDeviceState plc;
  final FieldDeviceState lighting;
  final String fmsType;

  const FieldElectronicsState({
    this.sccRed = FieldDeviceState.offline,
    this.sccBlue = FieldDeviceState.offline,
    this.fieldNetwork = FieldDeviceState.offline,
    this.plc = FieldDeviceState.offline,
    this.lighting = FieldDeviceState.offline,
    this.fmsType = '—',
  });
}

class CycleStats {
  final Duration last;
  final Duration fastest;
  final Duration slowest;
  final Duration average;
  final List<Duration> recent;
  final int matchesPlayed;
  final int matchesRemaining;
  final TimeOfDay? estimatedCompletion;

  const CycleStats({
    required this.last,
    required this.fastest,
    required this.slowest,
    required this.average,
    this.recent = const [],
    this.matchesPlayed = 0,
    this.matchesRemaining = 0,
    this.estimatedCompletion,
  });
}

// ─── Stub data ────────────────────────────────────────────────────────────────

const _stubRedAlliance = [
  RobotStation(
    teamNumber: 1234,
    ds: ConnectionState2.ok,
    radio: ConnectionState2.ok,
    rio: ConnectionState2.ok,
    code: ConnectionState2.ok,
    batteryVoltage: 12.3,
  ),
  RobotStation(
    teamNumber: 5678,
    ds: ConnectionState2.ok,
    radio: ConnectionState2.degraded,
    rio: ConnectionState2.degraded,
    code: ConnectionState2.none,
    batteryVoltage: 11.1,
    bypassed: true,
  ),
  RobotStation(
    teamNumber: 9012,
    ds: ConnectionState2.ok,
    radio: ConnectionState2.ok,
    rio: ConnectionState2.ok,
    code: ConnectionState2.ok,
    batteryVoltage: 12.6,
  ),
];

const _stubBlueAlliance = [
  RobotStation(
    teamNumber: 3456,
    ds: ConnectionState2.ok,
    radio: ConnectionState2.ok,
    rio: ConnectionState2.ok,
    code: ConnectionState2.ok,
    batteryVoltage: 12.4,
  ),
  RobotStation(
    teamNumber: 7890,
    ds: ConnectionState2.error,
    radio: ConnectionState2.error,
    rio: ConnectionState2.error,
    code: ConnectionState2.error,
    eStopped: true,
  ),
  RobotStation(
    teamNumber: 2345,
    ds: ConnectionState2.ok,
    radio: ConnectionState2.ok,
    rio: ConnectionState2.ok,
    code: ConnectionState2.ok,
    batteryVoltage: 12.1,
  ),
];

const _stubFieldElectronics = FieldElectronicsState(
  sccRed: FieldDeviceState.ready,
  sccBlue: FieldDeviceState.ready,
  fieldNetwork: FieldDeviceState.run,
  plc: FieldDeviceState.run,
  lighting: FieldDeviceState.auto,
  fmsType: 'Cheesy',
);

final _stubCycleStats = CycleStats(
  last: const Duration(minutes: 7, seconds: 38),
  fastest: const Duration(minutes: 6, seconds: 51),
  slowest: const Duration(minutes: 9, seconds: 12),
  average: const Duration(minutes: 7, seconds: 42),
  matchesPlayed: 14,
  matchesRemaining: 22,
  estimatedCompletion: const TimeOfDay(hour: 16, minute: 30),
  recent: [
    Duration(minutes: 7, seconds: 55),
    Duration(minutes: 8, seconds: 10),
    Duration(minutes: 6, seconds: 51),
    Duration(minutes: 9, seconds: 12),
  ],
);

// ─── Theme helpers ────────────────────────────────────────────────────────────

extension _ConnColor on ConnectionState2 {
  Color get dot => switch (this) {
    ConnectionState2.ok => const Color(0xFF1D9E75),
    ConnectionState2.degraded => const Color(0xFFEF9F27),
    ConnectionState2.error => const Color(0xFFE24B4A),
    ConnectionState2.none => const Color(0xFF888780),
  };

  Color get bg => switch (this) {
    ConnectionState2.ok => const Color(0x1F1D9E75),
    ConnectionState2.degraded => const Color(0x1FEF9F27),
    ConnectionState2.error => const Color(0x1AE24B4A),
    ConnectionState2.none => const Color(0x14888780),
  };

  Color get text => switch (this) {
    ConnectionState2.ok => const Color(0xFF0F6E56),
    ConnectionState2.degraded => const Color(0xFF854F0B),
    ConnectionState2.error => const Color(0xFFA32D2D),
    ConnectionState2.none => const Color(0xFF5F5E5A),
  };
}

extension _DeviceStateColor on FieldDeviceState {
  Color get badgeBg => switch (this) {
    FieldDeviceState.run => const Color(0x1F1D9E75),
    FieldDeviceState.ready => const Color(0x1F1D9E75),
    FieldDeviceState.fault => const Color(0x1AE24B4A),
    FieldDeviceState.offline => const Color(0x14888780),
    FieldDeviceState.auto => const Color(0x1A378ADD),
  };

  Color get badgeText => switch (this) {
    FieldDeviceState.run => const Color(0xFF0F6E56),
    FieldDeviceState.ready => const Color(0xFF0F6E56),
    FieldDeviceState.fault => const Color(0xFFA32D2D),
    FieldDeviceState.offline => const Color(0xFF5F5E5A),
    FieldDeviceState.auto => const Color(0xFF185FA5),
  };
}

String _fmtDuration(Duration d) {
  final m = d.inMinutes;
  final s = d.inSeconds % 60;
  return '$m:${s.toString().padLeft(2, '0')}';
}

// ─── Match Cycle Stepper ──────────────────────────────────────────────────────

class MatchCycleStepper extends StatelessWidget {
  final MatchPhase currentPhase;

  const MatchCycleStepper({super.key, required this.currentPhase});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final phases = MatchPhase.values;
    final currentIndex = phases.indexOf(currentPhase);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          for (int i = 0; i < phases.length; i++) ...[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _StepDot(done: i < currentIndex, active: i == currentIndex),
                  const SizedBox(height: 4),
                  Text(
                    phases[i].label,
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.4,
                      color: i < currentIndex
                          ? const Color(0xFF0F6E56)
                          : i == currentIndex
                          ? const Color(0xFF185FA5)
                          : cs.onSurfaceVariant.withOpacity(0.5),
                      fontWeight: i == currentIndex
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (i < phases.length - 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Container(
                  width: 12,
                  height: 1.5,
                  color: i < currentIndex
                      ? const Color(0xFF1D9E75)
                      : cs.outlineVariant.withOpacity(0.4),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool done;
  final bool active;

  const _StepDot({this.done = false, this.active = false});

  @override
  Widget build(BuildContext context) {
    final Color fill = done
        ? const Color(0xFF1D9E75)
        : active
        ? const Color(0xFF378ADD)
        : Theme.of(context).colorScheme.surfaceContainerHighest;

    final Color border = done
        ? const Color(0xFF1D9E75)
        : active
        ? const Color(0xFF378ADD)
        : Theme.of(context).colorScheme.outlineVariant;

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fill,
        border: Border.all(color: border, width: 1.5),
        boxShadow: active
            ? [
                BoxShadow(
                  color: const Color(0xFF378ADD).withOpacity(0.25),
                  blurRadius: 0,
                  spreadRadius: 3,
                ),
              ]
            : null,
      ),
    );
  }
}

// ─── Connection Pill ──────────────────────────────────────────────────────────

class _ConnPill extends StatelessWidget {
  final String label;
  final ConnectionState2 state;

  const _ConnPill({required this.label, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: state.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(shape: BoxShape.circle, color: state.dot),
          ),
          const SizedBox(width: 3),
          Text(label, style: TextStyle(fontSize: 10, color: state.text)),
        ],
      ),
    );
  }
}

// ─── Flag Button ──────────────────────────────────────────────────────────────

class _FlagButton extends StatelessWidget {
  final String label;
  final bool active;
  final Color activeColor;
  final VoidCallback? onTap;

  const _FlagButton({
    required this.label,
    this.active = false,
    required this.activeColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: active ? activeColor.withOpacity(0.12) : cs.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: active
                ? activeColor.withOpacity(0.5)
                : cs.outlineVariant.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: active ? activeColor : cs.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

// ─── Robot Station Row ────────────────────────────────────────────────────────

class RobotStationRow extends StatelessWidget {
  final RobotStation station;
  final bool redSide;

  const RobotStationRow({
    super.key,
    required this.station,
    this.redSide = true,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final battLabel = station.batteryVoltage != null
        ? 'Batt ${station.batteryVoltage!.toStringAsFixed(1)}v'
        : 'Batt —';

    final flagRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: redSide
          ? [
              _FlagButton(
                label: 'E-Stop',
                active: station.eStopped,
                activeColor: const Color(0xFFE24B4A),
              ),
              const SizedBox(width: 4),
              _FlagButton(
                label: 'Bypass',
                active: station.bypassed,
                activeColor: const Color(0xFFEF9F27),
              ),
            ]
          : [
              _FlagButton(
                label: 'Bypass',
                active: station.bypassed,
                activeColor: const Color(0xFFEF9F27),
              ),
              const SizedBox(width: 4),
              _FlagButton(
                label: 'E-Stop',
                active: station.eStopped,
                activeColor: const Color(0xFFE24B4A),
              ),
            ],
    );

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                station.teamNumber.toString(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              flagRow,
            ],
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              _ConnPill(label: 'DS', state: station.ds),
              _ConnPill(label: 'Radio', state: station.radio),
              _ConnPill(label: 'RIO', state: station.rio),
              _ConnPill(label: 'Code', state: station.code),
              _ConnPill(
                label: battLabel,
                state: station.batteryVoltage == null
                    ? ConnectionState2.none
                    : station.batteryVoltage! >= 12.0
                    ? ConnectionState2.ok
                    : station.batteryVoltage! >= 11.5
                    ? ConnectionState2.degraded
                    : ConnectionState2.error,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Alliance Card ────────────────────────────────────────────────────────────

class AllianceCard extends StatelessWidget {
  final bool isRed;
  final List<RobotStation> stations;
  final int score;

  const AllianceCard({
    super.key,
    required this.isRed,
    required this.stations,
    this.score = 0,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final color = isRed ? const Color(0xFFE24B4A) : const Color(0xFF378ADD);
    final headerColor = isRed
        ? const Color(0xFFE24B4A).withOpacity(0.12)
        : const Color(0xFF378ADD).withOpacity(0.12);
    final headerBorder = isRed
        ? const Color(0xFFE24B4A).withOpacity(0.2)
        : const Color(0xFF378ADD).withOpacity(0.2);
    final nameColor = isRed ? const Color(0xFFA32D2D) : const Color(0xFF185FA5);

    final header = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: headerColor,
        border: Border(bottom: BorderSide(color: headerBorder, width: 0.5)),
      ),
      child: Row(
        children: isRed
            ? [
                Text(
                  'Red Alliance',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: nameColor,
                  ),
                ),
                const Spacer(),
                Text(
                  '$score',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ]
            : [
                Text(
                  '$score',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
                const Spacer(),
                Text(
                  'Blue Alliance',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: nameColor,
                  ),
                ),
              ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                for (final station in stations) ...[
                  RobotStationRow(station: station, redSide: isRed),
                  if (station != stations.last) const SizedBox(height: 6),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Field Electronics Card ───────────────────────────────────────────────────

class FieldElectronicsCard extends StatelessWidget {
  final FieldElectronicsState state;

  const FieldElectronicsCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget row(String label, FieldDeviceState deviceState) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: deviceState.badgeBg,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              deviceState.label,
              style: TextStyle(fontSize: 10, color: deviceState.badgeText),
            ),
          ),
        ],
      ),
    );

    Widget fmsRow() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            'FMS',
            style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0x1F1D9E75),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              state.fmsType,
              style: const TextStyle(fontSize: 10, color: Color(0xFF0F6E56)),
            ),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: cs.outlineVariant.withOpacity(0.4),
                  width: 0.5,
                ),
              ),
            ),
            child: Text(
              'Field Electronics',
              style: TextStyle(
                fontSize: 10,
                color: cs.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                row('SCC Red', state.sccRed),
                row('SCC Blue', state.sccBlue),
                row('Field network', state.fieldNetwork),
                row('PLC', state.plc),
                row('Lighting', state.lighting),
                fmsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Field Centre Column ──────────────────────────────────────────────────────

class FieldCentreColumn extends StatelessWidget {
  final int timerSeconds;
  final String timerLabel;
  final CycleStats stats;
  final FieldElectronicsState electronics;

  const FieldCentreColumn({
    super.key,
    required this.timerSeconds,
    required this.timerLabel,
    required this.stats,
    required this.electronics,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final etaText = stats.estimatedCompletion != null
        ? '${stats.estimatedCompletion!.hour}:${stats.estimatedCompletion!.minute.toString().padLeft(2, '0')}'
        : '—';

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: cs.outlineVariant.withOpacity(0.4),
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              Text(
                timerLabel,
                style: TextStyle(
                  fontSize: 10,
                  color: cs.onSurfaceVariant.withOpacity(0.6),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$timerSeconds',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '↑ running',
                style: TextStyle(fontSize: 11, color: Color(0xFF378ADD)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1.6,
          children: [
            _MiniStat(label: 'Cycle avg', value: _fmtDuration(stats.average)),
            _MiniStat(label: 'Matches', value: '${stats.matchesPlayed}'),
            _MiniStat(label: 'Remaining', value: '${stats.matchesRemaining}'),
            _MiniStat(label: 'ETA done', value: etaText),
          ],
        ),
        const SizedBox(height: 8),
        FieldElectronicsCard(state: electronics),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;

  const _MiniStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              color: cs.onSurfaceVariant.withOpacity(0.6),
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// ─── Cycle Stats Strip ────────────────────────────────────────────────────────

class CycleStatsStrip extends StatelessWidget {
  final CycleStats stats;
  final String matchId;
  final String eventName;

  const CycleStatsStrip({
    super.key,
    required this.stats,
    this.matchId = '—',
    this.eventName = '—',
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final maxSeconds = stats.recent.isEmpty
        ? 1
        : stats.recent.map((d) => d.inSeconds).reduce((a, b) => a > b ? a : b);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          _StripStat(
            label: 'Last cycle',
            value: _fmtDuration(stats.last),
            unit: 'min',
          ),
          _StripDivider(),
          _StripStat(
            label: 'Fastest',
            value: _fmtDuration(stats.fastest),
            unit: 'min',
          ),
          _StripDivider(),
          _StripStat(
            label: 'Slowest',
            value: _fmtDuration(stats.slowest),
            unit: 'min',
          ),
          _StripDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Recent cycles',
                style: TextStyle(
                  fontSize: 9,
                  color: cs.onSurfaceVariant.withOpacity(0.6),
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int i = 0; i < stats.recent.length; i++) ...[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 14,
                          height: (stats.recent[i].inSeconds / maxSeconds * 28)
                              .clamp(4.0, 28.0),
                          decoration: BoxDecoration(
                            color: i == stats.recent.length - 1
                                ? const Color(0xFF378ADD).withOpacity(0.5)
                                : const Color(0xFF378ADD).withOpacity(0.2),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'M${stats.matchesPlayed - stats.recent.length + i + 1}',
                          style: TextStyle(
                            fontSize: 9,
                            color: cs.onSurfaceVariant.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    if (i < stats.recent.length - 1) const SizedBox(width: 4),
                  ],
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                matchId,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                eventName,
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StripStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _StripStat({required this.label, required this.value, this.unit = ''});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: cs.onSurfaceVariant.withOpacity(0.6),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 2),
        RichText(
          text: TextSpan(
            text: value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            children: [
              if (unit.isNotEmpty)
                TextSpan(
                  text: '  $unit',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: cs.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StripDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.4),
    );
  }
}

// ─── Field Monitor View ───────────────────────────────────────────────────────

class FieldMonitorView extends HookConsumerWidget {
  const FieldMonitorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MatchCycleStepper(currentPhase: MatchPhase.auto),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AllianceCard(
                  isRed: true,
                  stations: _stubRedAlliance,
                  score: 48,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 180,
                child: FieldCentreColumn(
                  timerSeconds: 12,
                  timerLabel: 'Autonomous',
                  stats: _stubCycleStats,
                  electronics: _stubFieldElectronics,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AllianceCard(
                  isRed: false,
                  stations: _stubBlueAlliance,
                  score: 36,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CycleStatsStrip(
            stats: _stubCycleStats,
            matchId: 'QM 14',
            eventName: 'WARP 2026 — Qual',
          ),
        ],
      ),
    );
  }
}
