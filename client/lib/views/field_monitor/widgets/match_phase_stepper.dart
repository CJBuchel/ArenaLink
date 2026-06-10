import 'package:flutter/material.dart';

enum MatchPhase {
  preMatch,
  configured,
  ready,
  auto,
  pause,
  teleop,
  over,
  postMatch,
  award;

  static MatchPhase fromMatchState(int state) => switch (state) {
    0 => preMatch,
    1 => configured,
    2 => ready,
    3 => auto,
    4 => pause,
    5 => teleop,
    6 => over,
    7 => postMatch,
    _ => award,
  };

  String get label => switch (this) {
    preMatch => 'PRE',
    configured => 'CONFIG',
    ready => 'READY',
    auto => 'AUTO',
    pause => 'PAUSE',
    teleop => 'TELEOP',
    over => 'OVER',
    postMatch => 'POST',
    award => 'AWARD',
  };

  Color get baseColor => switch (this) {
    preMatch => const Color(0xFF2870C2),
    configured => const Color(0xFFEF9F27),
    ready => const Color(0xFF1D9E75),
    auto => const Color(0xFF378ADD),
    pause => const Color(0xFFCF8F22),
    teleop => const Color(0xFF1A8C64),
    over => const Color(0xFF555E68),
    postMatch => const Color(0xFF3A4048),
    award => const Color(0xFFC9921B),
  };
}

class MatchPhaseStepper extends StatelessWidget {
  final int matchState;

  const MatchPhaseStepper({super.key, required this.matchState});

  @override
  Widget build(BuildContext context) {
    final current = MatchPhase.fromMatchState(matchState);
    final phases = MatchPhase.values;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF0E1012),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2E33), width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Row(
          children: [
            for (int i = 0; i < phases.length; i++) ...[
              Expanded(child: _Segment(phase: phases[i], current: current)),
              if (i < phases.length - 1)
                Container(width: 1, color: const Color(0xFF0E1012)),
            ],
          ],
        ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  final MatchPhase phase;
  final MatchPhase current;

  const _Segment({required this.phase, required this.current});

  @override
  Widget build(BuildContext context) {
    final isActive = phase == current;
    final isPast = phase.index < current.index;

    final Color bg;
    final Color fg;
    if (isActive) {
      bg = phase.baseColor;
      fg = Colors.white;
    } else if (isPast) {
      bg = phase.baseColor.withValues(alpha: 0.28);
      fg = Colors.white.withValues(alpha: 0.55);
    } else {
      bg = const Color(0xFF181B1E);
      fg = Colors.white.withValues(alpha: 0.18);
    }

    return Container(
      color: bg,
      alignment: Alignment.center,
      child: Text(
        phase.label,
        style: TextStyle(
          fontSize: isActive ? 10 : 9,
          fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
          color: fg,
          letterSpacing: 0.9,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
