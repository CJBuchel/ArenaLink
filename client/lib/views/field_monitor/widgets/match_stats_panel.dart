import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
class MatchStatsPanel extends HookWidget {
  final FieldMonitorState field;

  const MatchStatsPanel({super.key, required this.field});

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

  /// Format a DateTime as a 12-hour clock string using device local timezone.
  static String _fmtScheduledTime(DateTime? dt) {
    if (dt == null || dt.year < 2000) return '—';
    final displayed = dt.toLocal();
    final h = displayed.hour % 12 == 0 ? 12 : displayed.hour % 12;
    final m = displayed.minute.toString().padLeft(2, '0');
    final amPm = displayed.hour < 12 ? 'AM' : 'PM';
    return '$h:$m $amPm';
  }

  /// Compute the live signed delta: ahead (+) or behind (-) the scheduled time.
  ///
  /// Both sides are compared in UTC so the result is correct regardless of
  /// device timezone or [offsetHours] — UTC offsets cancel out in subtraction.
  static ({String label, Color color}) _computeDelta(
      DateTime? scheduled, DateTime now) {
    if (scheduled == null || scheduled.year < 2000) {
      return (label: '—', color: labelDim);
    }
    // diff > 0  →  now is past the scheduled time  →  running late
    final diff = now.toUtc().difference(scheduled.toUtc());
    final absSec = diff.inSeconds.abs();
    if (absSec < 30) {
      return (label: '+0:00', color: arenaGreen);
    }
    final m = absSec ~/ 60;
    final s = absSec % 60;
    final t = '$m:${s.toString().padLeft(2, '0')}';
    return diff.isNegative
        ? (label: '+$t', color: arenaGreen) // ahead — haven't reached sched yet
        : (label: '-$t', color: arenaRed);  // late  — past scheduled time
  }

  // ── Cycle time parsing ────────────────────────────────────────────────────

  static ({String timeStr, String label, Color color}) _parseCycle(
      String? cycle) {
    if (cycle == null || cycle.isEmpty) {
      return (timeStr: '—:—', label: '—', color: labelDim);
    }
    final actualMatch = RegExp(r'^(\d+:\d{2}(?::\d{2})?)').firstMatch(cycle);
    final timeStr = actualMatch?.group(1) ?? '—:—';

    final deltaMatch =
        RegExp(r'\([\d:]+\s+(slower|faster)').firstMatch(cycle.toLowerCase());
    if (deltaMatch == null) {
      return (timeStr: timeStr, label: '—', color: labelFaint);
    }
    final isFaster = deltaMatch.group(1) == 'faster';
    return (
      timeStr: timeStr,
      label: isFaster ? 'FAST' : 'SLOW',
      color: isFaster ? arenaGreen : arenaRed,
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

    final ms = field.matchState;
    final phase = _phaseLabel(ms);
    final phaseClr = _phaseColor(ms);

    final scheduled = field.scheduledStart;
    final schedStr = _fmtScheduledTime(scheduled);
    final delta = _computeDelta(scheduled, now.value);
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
              label: 'MATCH',
              flex: 2,
              children: [
                _LabelTile(value: phase, color: phaseClr, sub: 'STATE'),
                _LabelTile(
                  value: field.matchName.isNotEmpty ? field.matchName : '—',
                  color: labelFaint,
                  sub: 'MATCH',
                ),
              ],
            ),
            _Divider(),

            // ── Timing ─────────────────────────────────────────────────────
            // Three items: scheduled clock time | live ±delta | cycle time
            _Section(
              label: 'TIMING',
              flex: 4,
              children: [
                _LabelTile(
                  icon: Icons.schedule_rounded,
                  value: schedStr,
                  color: labelFaint,
                  sub: 'SCHED',
                  valueFontSize: 12,
                ),
                _LabelTile(
                  icon: Icons.swap_vert_rounded,
                  value: delta.label,
                  color: delta.color,
                  sub: 'DELTA',
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
  final double valueFontSize;

  const _LabelTile({
    required this.value,
    required this.sub,
    required this.color,
    this.icon,
    this.dot,
    this.valueFontSize = 15,
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
            fontSize: valueFontSize,
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
