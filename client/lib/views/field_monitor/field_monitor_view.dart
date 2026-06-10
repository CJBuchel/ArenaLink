import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/helpers/websocket_helper.dart';
import 'package:arena_link/providers/cheesy_arena_provider.dart';
import 'package:arena_link/views/field_monitor/widgets/alliance_panel.dart';
import 'package:arena_link/views/field_monitor/widgets/field_status_panel.dart';
import 'package:arena_link/views/field_monitor/widgets/match_phase_stepper.dart';
import 'package:arena_link/views/field_monitor/widgets/match_stats_panel.dart';

class FieldMonitorView extends HookConsumerWidget {
  const FieldMonitorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arena = ref.watch(cheesyArenaProvider);

    if (arena.arenaStatus == null) {
      return _ConnectionOverlay(status: arena.wsStatus);
    }

    final status = arena.arenaStatus!;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MatchPhaseStepper(matchState: status.matchState),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AlliancePanel(
                    isRed: true,
                    allStations: status.allianceStations,
                    matchState: status.matchState,
                  ),
                ),
                const SizedBox(width: 8),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 155,
                    child: FieldStatusPanel(status: status),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AlliancePanel(
                    isRed: false,
                    allStations: status.allianceStations,
                    matchState: status.matchState,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          MatchStatsPanel(
            status: status,
            eventStatus: arena.eventStatus,
            matchTime: arena.matchTime,
          ),
        ],
      ),
    );
  }
}

class _ConnectionOverlay extends StatelessWidget {
  final WebSocketStatus status;

  const _ConnectionOverlay({required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final spinning = status == WebSocketStatus.connecting ||
        status == WebSocketStatus.reconnecting;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (spinning)
            CircularProgressIndicator(color: cs.primary)
          else
            Icon(Icons.cloud_off_outlined, size: 40, color: cs.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            switch (status) {
              WebSocketStatus.connected => 'Waiting for data…',
              WebSocketStatus.connecting => 'Connecting…',
              WebSocketStatus.reconnecting => 'Reconnecting…',
              WebSocketStatus.disconnected => 'Disconnected',
            },
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
