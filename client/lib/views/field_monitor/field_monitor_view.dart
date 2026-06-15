import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/providers/arena_provider.dart';
import 'package:arena_link/providers/ticket_status_provider.dart';
import 'package:arena_link/views/field_monitor/widgets/alliance_panel.dart';
import 'package:arena_link/views/field_monitor/widgets/field_status_panel.dart';
import 'package:arena_link/views/field_monitor/widgets/match_stats_panel.dart';

class FieldMonitorView extends HookConsumerWidget {
  const FieldMonitorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ensure the ticket status WS service is running.
    ref.watch(ticketStatusProvider);

    final arena = ref.watch(arenaProvider);

    if (arena.field == null) {
      return _ConnectionOverlay(
        status:       arena.connection,
        fmsConnected: arena.fmsConnected,
      );
    }

    final field = arena.field!;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AlliancePanel(
                    isRed: true,
                    allStations: field.stations,
                    matchState: field.matchState,
                  ),
                ),
                const SizedBox(width: 8),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 155,
                    child: FieldStatusPanel(field: field),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AlliancePanel(
                    isRed: false,
                    allStations: field.stations,
                    matchState: field.matchState,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          MatchStatsPanel(field: field),
        ],
      ),
    );
  }
}

class _ConnectionOverlay extends StatelessWidget {
  final BackendConnectionStatus status;
  final bool fmsConnected;

  const _ConnectionOverlay({
    required this.status,
    required this.fmsConnected,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final serverConnected = status == BackendConnectionStatus.connected;
    final spinning = status == BackendConnectionStatus.connecting ||
        status == BackendConnectionStatus.reconnecting;

    final (IconData icon, String label, String? sub) = switch (true) {
      _ when spinning           => (Icons.sync_rounded, _spinLabel(status), null),
      _ when !serverConnected   => (Icons.cloud_off_outlined, 'Not connected to ArenaLink server', null),
      _ when !fmsConnected      => (Icons.cable_rounded, 'FMS not connected', 'ArenaLink server is running but not connected to the FMS.'),
      _                         => (Icons.hourglass_top_rounded, 'Waiting for data…', 'Connected to FMS — waiting for a match to load.'),
    };

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (spinning)
            CircularProgressIndicator(color: cs.primary)
          else
            Icon(icon, size: 40, color: cs.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          if (sub != null) ...[
            const SizedBox(height: 4),
            Text(sub,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }

  static String _spinLabel(BackendConnectionStatus s) => switch (s) {
    BackendConnectionStatus.connecting   => 'Connecting to ArenaLink server…',
    BackendConnectionStatus.reconnecting => 'Reconnecting to ArenaLink server…',
    _                                    => 'Connecting…',
  };
}
