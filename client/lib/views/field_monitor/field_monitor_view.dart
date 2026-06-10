import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/providers/cheesy_arena_provider.dart';

class FieldMonitorView extends HookConsumerWidget {
  const FieldMonitorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arena = ref.watch(cheesyArenaProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status: ${arena.wsStatus.name}'),
          const SizedBox(height: 8),
          if (arena.arenaStatus == null)
            const Text('No arena data yet.')
          else ...[
            Text('Match ID: ${arena.arenaStatus!.matchId}'),
            Text('Match State: ${arena.arenaStatus!.matchState}'),
            Text('Can Start Match: ${arena.arenaStatus!.canStartMatch}'),
            Text('PLC Healthy: ${arena.arenaStatus!.plcIsHealthy}'),
            Text('Field E-Stop: ${arena.arenaStatus!.fieldEStop}'),
            const SizedBox(height: 8),
            const Text('Alliance Stations:'),
            ...arena.arenaStatus!.allianceStations.entries.map(
              (e) => Text('  ${e.key}: team=${e.value.team?.id ?? 'none'}'
                  '  eStop=${e.value.eStop}'
                  '  bypass=${e.value.bypass}'),
            ),
          ],
        ],
      ),
    );
  }
}
