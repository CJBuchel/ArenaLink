import 'package:flutter/material.dart';
import 'package:arena_link/models/arena_status.dart';

class MatchStatsPanel extends StatelessWidget {
  final ArenaStatus status;
  final EventStatus? eventStatus;
  final MatchTimeMessage? matchTime;

  const MatchStatsPanel({
    super.key,
    required this.status,
    this.eventStatus,
    this.matchTime,
  });

  String _fmtTime(int? sec) {
    if (sec == null) return '—:—';
    final m = sec ~/ 60;
    final s = sec % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  Color _scheduleColor(String msg) {
    final lower = msg.toLowerCase();
    if (lower.contains('early')) return const Color(0xFF1D9E75);
    if (lower.contains('late') || lower.contains('behind')) return const Color(0xFFE24B4A);
    return const Color(0xFF1D9E75); // on time
  }

  @override
  Widget build(BuildContext context) {
    final timeSec = matchTime?.matchTimeSec;
    final cycle = eventStatus?.cycleTime;
    final schedule = eventStatus?.earlyLateMessage ?? '';

    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: const Color(0xFF0E1012),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2E33), width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Match ───────────────────────────────────────────────────────
            _Section(
              label: 'MATCH',
              flex: 2,
              children: [
                _Tile(
                  icon: Icons.tag_rounded,
                  value: '#${status.matchId}',
                  label: 'ID',
                  color: const Color(0xFFCDD4DC),
                ),
                _Tile(
                  icon: Icons.timer_rounded,
                  value: _fmtTime(timeSec),
                  label: 'TIME',
                  color: timeSec != null
                      ? const Color(0xFFCDD4DC)
                      : const Color(0xFF6B7480),
                ),
              ],
            ),
            _Divider(),

            // ── Timing ──────────────────────────────────────────────────────
            _Section(
              label: 'TIMING',
              flex: 3,
              children: [
                _Tile(
                  icon: Icons.loop_rounded,
                  value: cycle?.isNotEmpty == true ? cycle! : '—:—',
                  label: 'CYCLE',
                  color: cycle?.isNotEmpty == true
                      ? const Color(0xFFCDD4DC)
                      : const Color(0xFF6B7480),
                ),
                _Tile(
                  icon: Icons.schedule_rounded,
                  value: schedule.isNotEmpty ? schedule : 'ON TIME',
                  label: 'SCHEDULE',
                  color: _scheduleColor(schedule),
                ),
              ],
            ),
            _Divider(),

            // ── Score ────────────────────────────────────────────────────────
            _Section(
              label: 'SCORE',
              flex: 2,
              children: [
                _Tile(
                  icon: Icons.scoreboard_rounded,
                  value: '—',
                  label: 'RED',
                  color: const Color(0xFFE24B4A),
                ),
                _Tile(
                  icon: Icons.scoreboard_rounded,
                  value: '—',
                  label: 'BLUE',
                  color: const Color(0xFF378ADD),
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
                color: Color(0xFF4A5058),
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

// ─── Stat tile ────────────────────────────────────────────────────────────────

class _Tile extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _Tile({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: color),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4A5058),
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
        color: Color(0xFF2A2E33),
      ),
    );
  }
}
