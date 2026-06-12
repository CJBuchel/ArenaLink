import 'package:flutter/material.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/views/field_monitor/widgets/robot_station_card.dart';

class AlliancePanel extends StatelessWidget {
  final bool isRed;
  final Map<String, StationStatus> allStations;
  final int matchState;

  const AlliancePanel({
    super.key,
    required this.isRed,
    required this.allStations,
    required this.matchState,
  });

  @override
  Widget build(BuildContext context) {
    final keys = isRed ? ['R1', 'R2', 'R3'] : ['B3', 'B2', 'B1'];
    final entries = keys
        .map((k) => MapEntry(k, allStations[k]))
        .where((e) => e.value != null)
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        const gapH = 6.0;
        final n = entries.length;
        final totalGapH = gapH * (n - 1);
        final naturalH = (constraints.maxHeight - totalGapH) / n;

        final maxH = (constraints.maxWidth * 0.70).clamp(80.0, 300.0);
        final capped = naturalH > maxH;

        if (!capped) {
          return Column(
            children: [
              for (int i = 0; i < n; i++) ...[
                Expanded(
                  child: RobotStationCard(
                    stationKey: entries[i].key,
                    station: entries[i].value!,
                    isRed: isRed,
                    matchState: matchState,
                  ),
                ),
                if (i < n - 1) const SizedBox(height: gapH),
              ],
            ],
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < n; i++)
              SizedBox(
                height: maxH,
                child: RobotStationCard(
                  stationKey: entries[i].key,
                  station: entries[i].value!,
                  isRed: isRed,
                  matchState: matchState,
                ),
              ),
          ],
        );
      },
    );
  }
}
