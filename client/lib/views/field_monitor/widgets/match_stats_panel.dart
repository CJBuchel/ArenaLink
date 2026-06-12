import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';

class MatchStatsPanel extends HookWidget {
  final FieldMonitorState field;

  const MatchStatsPanel({super.key, required this.field});

  // ── Countdown ─────────────────────────────────────────────────────────────

  int? _countdownSec() {
    final elapsed = field.matchTimeSec;
    final auto = field.autoDurationSec;
    final pause = field.pauseDurationSec;
    final teleop = field.teleopDurationSec;
    return switch (field.matchState) {
      MatchStateConst.startMatch => auto,
      MatchStateConst.autoPeriod => (auto - elapsed).clamp(0, auto),
      MatchStateConst.pausePeriod =>
        ((auto + pause) - elapsed).clamp(0, pause),
      MatchStateConst.teleopPeriod =>
        ((auto + pause + teleop) - elapsed).clamp(0, teleop),
      _ => null,
    };
  }

  static String _fmtTime(int? sec) {
    if (sec == null) return '—:—';
    final m = sec ~/ 60;
    final s = sec % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  // ── Phase label + color ───────────────────────────────────────────────────

  static String _phaseLabel(int ms) => switch (ms) {
    MatchStateConst.preMatch => 'PRE',
    MatchStateConst.startMatch => 'START',
    MatchStateConst.autoPeriod => 'AUTO',
    MatchStateConst.pausePeriod => 'PAUSE',
    MatchStateConst.teleopPeriod => 'TELEOP',
    MatchStateConst.postMatch => 'POST',
    MatchStateConst.timeoutActive => 'TIMEOUT',
    MatchStateConst.postTimeout => 'POST',
    _ => '—',
  };

  static Color _phaseColor(int ms) => switch (ms) {
    MatchStateConst.startMatch ||
    MatchStateConst.autoPeriod => arenaBlue,
    MatchStateConst.pausePeriod => phasePauseAmber,
    MatchStateConst.teleopPeriod => phaseTeleopTeal,
    MatchStateConst.timeoutActive => arenaGrey,
    _ => labelDim,
  };

  // ── Schedule helpers ──────────────────────────────────────────────────────

  static ({String label, String timeStr, Color color}) _scheduleFromTime(
      DateTime scheduled, DateTime now) {
    const green = arenaGreen;
    const red = arenaRed;

    final diff = now.difference(scheduled);
    final absSec = diff.inSeconds.abs();
    final timeStr = _fmtTime(absSec);

    if (absSec < 5) {
      return (label: 'ON TIME', timeStr: '0:00', color: green);
    }
    return diff.isNegative
        ? (label: 'AHEAD', timeStr: timeStr, color: green)
        : (label: 'BEHIND', timeStr: timeStr, color: red);
  }

  static ({String label, String timeStr, Color color}) _scheduleFromAnchor(
      _SchedAnchor? anchor, DateTime now) {
    const grey = labelDim;
    const green = arenaGreen;
    const red = arenaRed;

    if (anchor == null) return (label: '—', timeStr: '—:—', color: grey);
    if (anchor.onTime) return (label: 'ON TIME', timeStr: '0:00', color: green);

    final liveSec =
        anchor.baseSec + now.difference(anchor.capturedAt).inSeconds;
    final timeStr = _fmtTime(liveSec.clamp(0, liveSec));

    return anchor.isLate
        ? (label: 'BEHIND', timeStr: timeStr, color: red)
        : (label: 'AHEAD', timeStr: timeStr, color: green);
  }

  // ── Cycle time parsing ────────────────────────────────────────────────────

  static ({String timeStr, String label, Color color}) _parseCycle(
      String? cycle) {
    const grey = labelDim;
    const green = arenaGreen;
    const red = arenaRed;
    const white = labelFaint;

    if (cycle == null || cycle.isEmpty) {
      return (timeStr: '—:—', label: '—', color: grey);
    }

    final actualMatch = RegExp(r'^(\d+:\d{2}(?::\d{2})?)').firstMatch(cycle);
    final timeStr = actualMatch?.group(1) ?? '—:—';

    final deltaMatch =
        RegExp(r'\([\d:]+\s+(slower|faster)').firstMatch(cycle.toLowerCase());

    if (deltaMatch == null) {
      return (timeStr: timeStr, label: '—', color: white);
    }

    final isFaster = deltaMatch.group(1) == 'faster';
    return (
      timeStr: timeStr,
      label: isFaster ? 'FAST' : 'SLOW',
      color: isFaster ? green : red,
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = useState(DateTime.now());
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        now.value = DateTime.now();
      });
      return timer.cancel;
    }, const []);

    final anchor = useState<_SchedAnchor?>(null);
    useEffect(() {
      anchor.value = _SchedAnchor.parse(field.scheduleOffset);
      return null;
    }, [field.scheduleOffset]);

    final ms = field.matchState;
    final countdown = _countdownSec();
    final phase = _phaseLabel(ms);
    final phaseClr = _phaseColor(ms);

    final hasScheduledTime =
        field.scheduledStart != null && field.scheduledStart!.year > 2000;
    final sched = hasScheduledTime
        ? _scheduleFromTime(field.scheduledStart!, now.value)
        : _scheduleFromAnchor(anchor.value, now.value);

    final cycle = _parseCycle(
      field.cycleTime.isNotEmpty ? field.cycleTime : null,
    );

    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: surfaceBorder, width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Match ──────────────────────────────────────────────────────
            _Section(
              label: 'MATCH  #${field.matchId}',
              flex: 2,
              children: [
                _LabelTile(value: phase, color: phaseClr, sub: 'STATE'),
                _LabelTile(
                  icon: Icons.timer_rounded,
                  value: _fmtTime(countdown),
                  color: countdown != null ? phaseClr : labelDim,
                  sub: 'TIME',
                ),
              ],
            ),
            _Divider(),

            // ── Timing ─────────────────────────────────────────────────────
            _Section(
              label: 'TIMING',
              flex: 3,
              children: [
                _StatusValueTile(
                  topLabel: sched.label,
                  value: sched.timeStr,
                  sub: 'SCHED',
                  color: sched.color,
                ),
                _StatusValueTile(
                  topLabel: cycle.label,
                  value: cycle.timeStr,
                  sub: 'CYCLE',
                  color: cycle.color,
                  icon: Icons.loop_rounded,
                ),
              ],
            ),
            _Divider(),

            // ── Score ───────────────────────────────────────────────────────
            _Section(
              label: 'SCORE',
              flex: 2,
              children: [
                _LabelTile(
                  dot: arenaRed,
                  value: field.redScore != null ? '${field.redScore}' : '—',
                  color: arenaRed,
                  sub: 'RED',
                ),
                _LabelTile(
                  dot: arenaBlue,
                  value: field.blueScore != null ? '${field.blueScore}' : '—',
                  color: arenaBlue,
                  sub: 'BLUE',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Section ──────────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final String label;
  final List<Widget> children;
  final int flex;

  const _Section({required this.label, required this.children, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: labelMuted,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Status + value tile ──────────────────────────────────────────────────────

class _StatusValueTile extends StatelessWidget {
  final String topLabel;
  final String value;
  final String sub;
  final Color color;
  final IconData? icon;

  const _StatusValueTile({
    required this.topLabel,
    required this.value,
    required this.sub,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (topLabel != '—')
          Text(
            topLabel,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: 0.8,
            ),
          )
        else if (icon != null)
          Icon(icon!, size: 11, color: labelMuted)
        else
          const SizedBox(height: 11),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: color,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: labelMuted,
            letterSpacing: 0.4,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

// ─── Generic label tile ───────────────────────────────────────────────────────

class _LabelTile extends StatelessWidget {
  final String value;
  final String sub;
  final Color color;
  final IconData? icon;
  final Color? dot;

  const _LabelTile({
    required this.value,
    required this.sub,
    required this.color,
    this.icon,
    this.dot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon!, size: 13, color: color),
          const SizedBox(height: 3),
        ] else if (dot != null) ...[
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dot),
          ),
          const SizedBox(height: 3),
        ],
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: color,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: labelMuted,
            letterSpacing: 0.4,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

// ─── Section divider ──────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: VerticalDivider(
        width: 1,
        thickness: 0.5,
        color: surfaceBorder,
      ),
    );
  }
}

// ─── Schedule anchor ──────────────────────────────────────────────────────────

class _SchedAnchor {
  final int baseSec;
  final bool isLate;
  final bool onTime;
  final DateTime capturedAt;

  const _SchedAnchor({
    required this.baseSec,
    required this.isLate,
    required this.onTime,
    required this.capturedAt,
  });

  static _SchedAnchor? parse(String? msg) {
    if (msg == null || msg.isEmpty) return null;
    final lower = msg.toLowerCase();

    if (lower.contains('on schedule')) {
      return _SchedAnchor(
        baseSec: 0,
        isLate: false,
        onTime: true,
        capturedAt: DateTime.now(),
      );
    }

    final m = RegExp(r'(\d+) minutes? (late|early)').firstMatch(lower);
    if (m == null) return null;

    return _SchedAnchor(
      baseSec: int.parse(m.group(1)!) * 60,
      isLate: m.group(2) == 'late',
      onTime: false,
      capturedAt: DateTime.now(),
    );
  }
}
