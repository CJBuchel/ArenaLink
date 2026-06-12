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
      return _ConnectionOverlay(status: arena.connection);
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

  const _ConnectionOverlay({required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final spinning =
        status == BackendConnectionStatus.connecting ||
        status == BackendConnectionStatus.reconnecting;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (spinning)
            CircularProgressIndicator(color: cs.primary)
          else
            Icon(
              Icons.cloud_off_outlined,
              size: 40,
              color: cs.onSurfaceVariant,
            ),
          const SizedBox(height: 12),
          Text(switch (status) {
            BackendConnectionStatus.connected => 'Waiting for data…',
            BackendConnectionStatus.connecting => 'Connecting…',
            BackendConnectionStatus.reconnecting => 'Reconnecting…',
            BackendConnectionStatus.disconnected => 'Disconnected',
          }, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
