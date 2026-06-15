import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/services/log_service.dart';

// ─── Match log screen ─────────────────────────────────────────────────────────
// Lists all matches the team has played (newest first).
// Each row shows match info with a dedicated chart button.

class MatchLogScreen extends StatelessWidget {
  final EventTeam team;
  final List<MatchRecord> matchLog;
  final String serverHost;
  final int serverPort;

  const MatchLogScreen({
    super.key,
    required this.team,
    required this.matchLog,
    required this.serverHost,
    required this.serverPort,
  });

  List<MatchRecord> get _teamMatches {
    return matchLog
        .where((m) =>
            m.redTeams.contains(team.id) || m.blueTeams.contains(team.id))
        .toList()
        .reversed
        .toList(); // newest first
  }

  String _station(MatchRecord m) {
    final ri = m.redTeams.indexOf(team.id);
    if (ri >= 0) return 'R${ri + 1}';
    final bi = m.blueTeams.indexOf(team.id);
    if (bi >= 0) return 'B${bi + 1}';
    return '—';
  }

  @override
  Widget build(BuildContext context) {
    final matches = _teamMatches;
    final nickname = team.nickname.isNotEmpty ? team.nickname : team.name;

    return Scaffold(
      backgroundColor: surfaceCard,
      appBar: AppBar(
        backgroundColor: surfaceBar,
        foregroundColor: labelFaint,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: surfaceIdle,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${team.id}',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: labelFaint),
                ),
              ),
              if (nickname.isNotEmpty) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    nickname,
                    style: const TextStyle(fontSize: 14, color: labelDim),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: surfaceBorder),
        ),
      ),
      body: matches.isEmpty
          ? _EmptyMatchState(teamId: team.id)
          : Column(
              children: [
                // ── Summary bar ──────────────────────────────────────────────
                _SummaryBar(team: team, matches: matches),
                const Divider(height: 1, color: surfaceBorder),
                // ── Match list ───────────────────────────────────────────────
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    itemCount: matches.length,
                    itemBuilder: (context, i) {
                      final m = matches[i];
                      final station = _station(m);
                      final isRed = station.startsWith('R');

                      return _MatchTile(
                        record: m,
                        station: station,
                        isRed: isRed,
                        teamId: team.id,
                        onChart: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => _MatchGraphScreen(
                              team: team,
                              record: m,
                              station: station,
                              logService: LogService(
                                serverHost: serverHost,
                                serverPort: serverPort,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

// ─── Summary bar ─────────────────────────────────────────────────────────────

class _SummaryBar extends StatelessWidget {
  final EventTeam team;
  final List<MatchRecord> matches;

  const _SummaryBar({required this.team, required this.matches});

  @override
  Widget build(BuildContext context) {
    int wins = 0, losses = 0, ties = 0;
    for (final m in matches) {
      final isRed = m.redTeams.contains(team.id);
      switch (m.result) {
        case MatchResult.redWon:
          isRed ? wins++ : losses++;
        case MatchResult.blueWon:
          !isRed ? wins++ : losses++;
        case MatchResult.tie:
          ties++;
        case MatchResult.notPlayed:
          break;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          _StatChip(label: 'Played', value: '${matches.length}', color: labelDim),
          const SizedBox(width: 10),
          _StatChip(label: 'W', value: '$wins', color: arenaGreen),
          const SizedBox(width: 6),
          _StatChip(label: 'L', value: '$losses', color: arenaRed),
          const SizedBox(width: 6),
          _StatChip(label: 'T', value: '$ties', color: arenaAmber),
          if (team.rank != null) ...[
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: arenaBlue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: arenaBlue.withValues(alpha: 0.3)),
              ),
              child: Text(
                'Rank #${team.rank}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: arenaBlue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: labelMuted),
        ),
      ],
    );
  }
}

// ─── Match tile ───────────────────────────────────────────────────────────────

class _MatchTile extends StatelessWidget {
  final MatchRecord record;
  final String station;
  final bool isRed;
  final int teamId;
  final VoidCallback onChart;

  const _MatchTile({
    required this.record,
    required this.station,
    required this.isRed,
    required this.teamId,
    required this.onChart,
  });

  @override
  Widget build(BuildContext context) {
    final allianceColor = isRed ? arenaRed : arenaBlue;

    final (resultLabel, resultColor) = switch (record.result) {
      MatchResult.redWon => isRed
          ? ('WIN', arenaGreen)
          : ('LOSS', arenaRed),
      MatchResult.blueWon => !isRed
          ? ('WIN', arenaGreen)
          : ('LOSS', arenaRed),
      MatchResult.tie     => ('TIE', arenaAmber),
      MatchResult.notPlayed => ('—', labelMuted),
    };

    final hasScore = record.redScore != null && record.blueScore != null;
    final myScore   = isRed ? record.redScore : record.blueScore;
    final oppScore  = isRed ? record.blueScore : record.redScore;

    final dateStr = record.playedAt != null
        ? _formatDate(record.playedAt!.toLocal())
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: surfaceBar,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: surfaceBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
        child: Row(
          children: [
            // ── Alliance station badge ─────────────────────────────────────
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: allianceColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: allianceColor.withValues(alpha: 0.4)),
              ),
              child: Center(
                child: Text(
                  station,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: allianceColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // ── Match info ─────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        record.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: labelFaint,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Result badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: resultColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: resultColor.withValues(alpha: 0.35)),
                        ),
                        child: Text(
                          resultLabel,
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                            color: resultColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      // Score
                      if (hasScore) ...[
                        Text(
                          '$myScore',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: resultColor,
                          ),
                        ),
                        Text(
                          ' – $oppScore',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: labelDim,
                          ),
                        ),
                      ] else
                        Text(
                          record.result == MatchResult.notPlayed
                              ? 'Not played'
                              : 'No score',
                          style: const TextStyle(
                              fontSize: 11, color: labelMuted),
                        ),
                      if (dateStr != null) ...[
                        const SizedBox(width: 8),
                        const Text('·',
                            style: TextStyle(color: labelMuted, fontSize: 10)),
                        const SizedBox(width: 8),
                        Text(
                          dateStr,
                          style: const TextStyle(
                              fontSize: 10, color: labelMuted),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // ── Chart button ───────────────────────────────────────────────
            Tooltip(
              message: 'View match log chart',
              child: InkWell(
                onTap: onChart,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: surfaceIdle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: surfaceBorder),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.bar_chart_rounded,
                          size: 20, color: arenaBlue),
                      const SizedBox(height: 2),
                      Text(
                        'Logs',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          color: arenaBlue.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyMatchState extends StatelessWidget {
  final int teamId;
  const _EmptyMatchState({required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bar_chart_rounded, size: 48, color: labelMuted),
          const SizedBox(height: 12),
          Text(
            'No played matches for team $teamId.',
            style: const TextStyle(color: labelDim, fontSize: 13),
          ),
          const SizedBox(height: 4),
          const Text(
            'Matches will appear here after they are played.',
            style: TextStyle(color: labelMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// ─── Match graph screen ───────────────────────────────────────────────────────

class _MatchGraphScreen extends StatefulWidget {
  final EventTeam team;
  final MatchRecord record;
  final String station;
  final LogService logService;

  const _MatchGraphScreen({
    required this.team,
    required this.record,
    required this.station,
    required this.logService,
  });

  @override
  State<_MatchGraphScreen> createState() => _MatchGraphScreenState();
}

class _MatchGraphScreenState extends State<_MatchGraphScreen> {
  late Future<List<MatchLogRow>> _future;

  @override
  void initState() {
    super.initState();
    // Use the directory-listing approach: scan /static/logs/, filter by
    // match short-name + team ID suffix, pick the most-recent replay.
    _future = widget.logService.fetchLogForTeam(
      widget.record.name,  // e.g. "P2", "Q3", "SF1-1"
      widget.team.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRed = widget.station.startsWith('R');
    final allianceColor = isRed ? arenaRed : arenaBlue;

    return Scaffold(
      backgroundColor: surfaceCard,
      appBar: AppBar(
        backgroundColor: surfaceBar,
        foregroundColor: labelFaint,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: allianceColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: allianceColor.withValues(alpha: 0.4)),
                ),
                child: Text(
                  widget.station,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: allianceColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.record.name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: labelFaint),
                  ),
                  Text(
                    'Team ${widget.team.id}',
                    style: const TextStyle(fontSize: 10, color: labelDim),
                  ),
                ],
              ),
            ],
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: surfaceBorder),
        ),
      ),
      body: FutureBuilder<List<MatchLogRow>>(
        future: _future,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Loading match log…',
                      style: TextStyle(color: labelDim, fontSize: 12)),
                ],
              ),
            );
          }
          if (snap.hasError) {
            return _ErrorState(
              error: snap.error.toString(),
              matchName: widget.record.name,
              teamId: widget.team.id,
            );
          }
          final rows = snap.data!;
          if (rows.isEmpty) {
            return _NoLogState(
              matchName: widget.record.name,
              station: widget.station,
            );
          }
          return _MatchGraph(rows: rows);
        },
      ),
    );
  }
}

// ─── Error / no-log states ────────────────────────────────────────────────────

class _ErrorState extends StatelessWidget {
  final String error;
  final String matchName;
  final int teamId;

  const _ErrorState({
    required this.error,
    required this.matchName,
    required this.teamId,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 40, color: arenaRed),
            const SizedBox(height: 12),
            Text(
              'Could not load log for $matchName · team $teamId',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: labelFaint),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            const Text(
              'Check that the ArenaLink server is running and reachable.',
              textAlign: TextAlign.center,
              style: TextStyle(color: labelDim, fontSize: 11),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: surfaceIdle,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: surfaceBorder),
              ),
              child: SelectableText(
                error,
                style: const TextStyle(
                    fontSize: 10, color: labelMuted, fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoLogState extends StatelessWidget {
  final String matchName;
  final String station;

  const _NoLogState({required this.matchName, required this.station});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.insert_chart_outlined_rounded,
              size: 40, color: labelMuted),
          const SizedBox(height: 12),
          Text(
            'No log found for $matchName · $station',
            style: const TextStyle(color: labelDim, fontSize: 13),
          ),
          const SizedBox(height: 4),
          const Text(
            'Log files are created when a match is run on the field.',
            style: TextStyle(color: labelMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// Chart colors — matching official FRC / Cheesy Arena conventions
const _colDs       = arenaRed;              // red
const _colRadio    = Color(0xFF9B59B6);     // purple
const _colRio      = arenaAmber;            // amber/yellow
const _colRobot    = Color(0xFF00BCD4);     // cyan
const _colEth      = Color(0xFF78909C);     // grey-blue
const _colAuto     = phasePreBlue;          // blue (arena auto / DS auto)
const _colEnabled  = arenaGreen;            // green (arena enabled / DS enabled)

// ─── Graph ────────────────────────────────────────────────────────────────────
//
// Multi-panel synchronized chart layout. All panels share the same X axis.
// fl_chart's built-in hover/touch shows a tooltip per panel on interaction.

class _MatchGraph extends StatelessWidget {
  final List<MatchLogRow> rows;

  const _MatchGraph({required this.rows});

  @override
  Widget build(BuildContext context) {
    final rows = this.rows;
    if (rows.isEmpty) return const SizedBox.shrink();

    final maxX = rows.last.matchTimeSec;

    // ── Phase boundaries ─────────────────────────────────────────────────────
    double? autoEnd;
    double? teleopStart;
    for (var i = 0; i < rows.length - 1; i++) {
      if (rows[i].auto && !rows[i + 1].auto && autoEnd == null) {
        autoEnd = rows[i].matchTimeSec;
      }
      if (autoEnd != null &&
          !rows[i].enabled &&
          rows[i + 1].enabled &&
          !rows[i + 1].auto &&
          teleopStart == null) {
        teleopStart = rows[i + 1].matchTimeSec;
      }
    }

    // ── Spot lists ───────────────────────────────────────────────────────────
    // Link series — 5 stacked boolean tracks (spacing 1.5):
    //   DS:      base 0.0   → 0.0 / 1.0
    //   Radio:   base 1.5   → 1.5 / 2.5
    //   Rio:     base 3.0   → 3.0 / 4.0
    //   Robot:   base 4.5   → 4.5 / 5.5
    //   Ethernet:base 6.0   → 6.0 / 7.0
    final dsSpots    = <FlSpot>[];
    final radioSpots = <FlSpot>[];
    final rioSpots   = <FlSpot>[];
    final robotSpots = <FlSpot>[];
    final ethSpots   = <FlSpot>[];
    // Mode series — 4 stacked tracks (spacing 1.5):
    //   Arena Auto: base 0.0 → 0.0 / 1.0  (solid)
    //   DS Auto:    base 1.5 → 1.5 / 2.5  (dashed)
    //   Arena Enbl: base 3.0 → 3.0 / 4.0  (solid)
    //   DS Enbl:    base 4.5 → 4.5 / 5.5  (dashed)
    final arAutoSpots = <FlSpot>[];
    final dsAutoSpots = <FlSpot>[];
    final arEnblSpots = <FlSpot>[];
    final dsEnblSpots = <FlSpot>[];
    // Continuous
    final voltageSpots = <FlSpot>[];
    final rxSpots      = <FlSpot>[];
    final txSpots      = <FlSpot>[];
    final packetSpots  = <FlSpot>[];

    for (final r in rows) {
      final x = r.matchTimeSec;
      dsSpots.add(FlSpot(x,    r.dsLinked    ? 1.0 : 0.0));
      radioSpots.add(FlSpot(x, r.radioLinked ? 2.5 : 1.5));
      rioSpots.add(FlSpot(x,   r.rioLinked   ? 4.0 : 3.0));
      robotSpots.add(FlSpot(x, r.robotLinked ? 5.5 : 4.5));
      ethSpots.add(FlSpot(x,   r.ethernet    ? 7.0 : 6.0));
      arAutoSpots.add(FlSpot(x, r.auto      ? 1.0 : 0.0));
      dsAutoSpots.add(FlSpot(x, r.dsAuto    ? 2.5 : 1.5));
      arEnblSpots.add(FlSpot(x, r.enabled   ? 4.0 : 3.0));
      dsEnblSpots.add(FlSpot(x, r.dsEnabled ? 5.5 : 4.5));
      voltageSpots.add(FlSpot(x, r.voltage));
      rxSpots.add(FlSpot(x, r.rxRate));
      txSpots.add(FlSpot(x, r.txRate));
      packetSpots.add(FlSpot(x, r.missedPackets.toDouble()));
    }

    final xInterval = _niceXInterval(maxX);

    final voltMax = voltageSpots.fold(0.0, (m, s) => s.y > m ? s.y : m);
    final yVolt   = ((voltMax / 2).ceil() * 2.0).clamp(8.0, 16.0);
    final bwMax   = [...rxSpots, ...txSpots].fold(0.0, (m, s) => s.y > m ? s.y : m);
    final yBw     = ((bwMax / 2).ceil() * 2.0).clamp(2.0, 20.0);
    final pkMax   = packetSpots.fold(0.0, (m, s) => s.y > m ? s.y : m);
    final yPk     = ((pkMax / 5).ceil() * 5.0).clamp(5.0, 100.0);
    final pkInt   = yPk <= 10 ? 2.0 : yPk <= 20 ? 5.0 : 10.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 10, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                // ── Link ──────────────────────────────────────────────────
                _panelHeader('Link', [
                  _SeriesLabel(color: _colDs,    text: 'DS'),
                  _SeriesLabel(color: _colRadio, text: 'Radio'),
                  _SeriesLabel(color: _colRio,   text: 'Rio'),
                  _SeriesLabel(color: _colRobot, text: 'Robot'),
                  _SeriesLabel(color: _colEth,   text: 'Eth'),
                ]),
                SizedBox(
                  height: 190,
                  child: _linkChart(maxX, xInterval, autoEnd, teleopStart,
                      dsSpots, radioSpots, rioSpots, robotSpots, ethSpots),
                ),
                const SizedBox(height: 10),

                // ── Mode ──────────────────────────────────────────────────
                _panelHeader('Mode', [
                  _SeriesLabel(color: _colAuto,    text: 'Ar.Auto'),
                  _SeriesLabel(color: _colAuto,    text: 'DS.Auto',  dashed: true),
                  _SeriesLabel(color: _colEnabled, text: 'Ar.Enbl'),
                  _SeriesLabel(color: _colEnabled, text: 'DS.Enbl',  dashed: true),
                ]),
                SizedBox(
                  height: 140,
                  child: _modeChart(maxX, xInterval, autoEnd, teleopStart,
                      arAutoSpots, dsAutoSpots, arEnblSpots, dsEnblSpots),
                ),
                const SizedBox(height: 10),

                // ── Voltage ───────────────────────────────────────────────
                _panelHeader('Voltage (V)', [
                  _SeriesLabel(color: _colEnabled, text: 'Voltage'),
                ]),
                SizedBox(
                  height: 120,
                  child: _continuousChart(
                    maxX: maxX, xInterval: xInterval,
                    autoEnd: autoEnd, teleopStart: teleopStart,
                    series: [_line(voltageSpots, _colEnabled)],
                    yMax: yVolt, yInterval: 2,
                    tooltip: (spots) => spots.isEmpty ? [] : [
                      LineTooltipItem(
                        '${spots.first.x.toStringAsFixed(1)}s  '
                        '${spots.first.y.toStringAsFixed(1)}V',
                        _tipStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // ── Bandwidth ─────────────────────────────────────────────
                _panelHeader('Bandwidth (Mbps)', [
                  _SeriesLabel(color: arenaBlue,    text: 'RX↓'),
                  _SeriesLabel(color: _colRadio,    text: 'TX↑'),
                ]),
                SizedBox(
                  height: 120,
                  child: _continuousChart(
                    maxX: maxX, xInterval: xInterval,
                    autoEnd: autoEnd, teleopStart: teleopStart,
                    series: [
                      _line(rxSpots, arenaBlue),
                      _line(txSpots, _colRadio),
                    ],
                    yMax: yBw, yInterval: 2,
                    tooltip: (spots) {
                      if (spots.isEmpty) return [];
                      final t = spots.first.x.toStringAsFixed(1);
                      final rx = spots.isNotEmpty ? spots[0].y.toStringAsFixed(2) : '—';
                      final tx = spots.length > 1  ? spots[1].y.toStringAsFixed(2) : '—';
                      return [
                        LineTooltipItem(
                          '$t s\nRX: $rx  TX: $tx Mbps', _tipStyle),
                        if (spots.length > 1) null,
                      ];
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // ── Missed packets (last — shows X axis) ──────────────────
                _panelHeader('Missed Packets', [
                  _SeriesLabel(color: _colDs, text: 'Pkts Lost'),
                ]),
                SizedBox(
                  height: 120,
                  child: _continuousChart(
                    maxX: maxX, xInterval: xInterval,
                    autoEnd: autoEnd, teleopStart: teleopStart,
                    series: [_line(packetSpots, _colDs)],
                    yMax: yPk, yInterval: pkInt,
                    tooltip: (spots) => spots.isEmpty ? [] : [
                      LineTooltipItem(
                        '${spots.first.x.toStringAsFixed(1)}s  '
                        '${spots.first.y.toInt()} pkts',
                        _tipStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ── Panel header helper ────────────────────────────────────────────────────

  Widget _panelHeader(String title, List<Widget> legend) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: labelDim,
                letterSpacing: 0.3,
              )),
          for (final w in legend) ...[const SizedBox(width: 8), w],
        ],
      ),
    );
  }

  // ── Link chart (5 boolean tracks) ─────────────────────────────────────────

  Widget _linkChart(
    double maxX, double xInterval,
    double? autoEnd, double? teleopStart,
    List<FlSpot> ds, List<FlSpot> radio, List<FlSpot> rio,
    List<FlSpot> robot, List<FlSpot> eth,
  ) {
    final labelMap = {
      0.5: ('DS',    _colDs),
      2.0: ('Radio', _colRadio),
      3.5: ('Rio',   _colRio),
      5.0: ('Robot', _colRobot),
      6.5: ('Eth',   _colEth),
    };
    return LineChart(LineChartData(
      minX: 0, maxX: maxX, minY: -0.2, maxY: 7.5,
      clipData: const FlClipData.all(),
      gridData: const FlGridData(show: false),
      borderData: _border(),
      rangeAnnotations: _phaseRanges(autoEnd, teleopStart, maxX),
      extraLinesData: _phaseLines(autoEnd, teleopStart),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            interval: 0.5,
            getTitlesWidget: (v, _) {
              for (final e in labelMap.entries) {
                if ((e.key - v).abs() < 0.05) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(e.value.$1,
                        style: TextStyle(fontSize: 8, color: e.value.$2,
                            fontWeight: FontWeight.w700)),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 14,
            interval: xInterval,
            getTitlesWidget: (v, _) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('${v.toInt()}s',
                  style: const TextStyle(fontSize: 8, color: labelDim)),
            ),
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: _touchData(_timeTooltip),
      lineBarsData: [
        _stepLine(ds,    _colDs),
        _stepLine(radio, _colRadio),
        _stepLine(rio,   _colRio),
        _stepLine(robot, _colRobot),
        _stepLine(eth,   _colEth),
      ],
    ));
  }

  // ── Mode chart (4 boolean tracks, DS tracks dashed) ───────────────────────

  Widget _modeChart(
    double maxX, double xInterval,
    double? autoEnd, double? teleopStart,
    List<FlSpot> arAuto, List<FlSpot> dsAuto,
    List<FlSpot> arEnbl, List<FlSpot> dsEnbl,
  ) {
    final labelMap = {
      0.5: ('Ar.Auto', _colAuto),
      2.0: ('DS.Auto', _colAuto),
      3.5: ('Ar.Enbl', _colEnabled),
      5.0: ('DS.Enbl', _colEnabled),
    };
    return LineChart(LineChartData(
      minX: 0, maxX: maxX, minY: -0.2, maxY: 6.0,
      clipData: const FlClipData.all(),
      gridData: const FlGridData(show: false),
      borderData: _border(),
      rangeAnnotations: _phaseRanges(autoEnd, teleopStart, maxX),
      extraLinesData: _phaseLines(autoEnd, teleopStart),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            interval: 0.5,
            getTitlesWidget: (v, _) {
              for (final e in labelMap.entries) {
                if ((e.key - v).abs() < 0.05) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(e.value.$1,
                        style: TextStyle(fontSize: 8, color: e.value.$2,
                            fontWeight: FontWeight.w700)),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 14,
            interval: xInterval,
            getTitlesWidget: (v, _) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('${v.toInt()}s',
                  style: const TextStyle(fontSize: 8, color: labelDim)),
            ),
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: _touchData(_timeTooltip),
      lineBarsData: [
        _stepLine(arAuto, _colAuto),
        _stepLine(dsAuto, _colAuto,    dashed: true),
        _stepLine(arEnbl, _colEnabled),
        _stepLine(dsEnbl, _colEnabled, dashed: true),
      ],
    ));
  }

  // ── Continuous chart ───────────────────────────────────────────────────────

  Widget _continuousChart({
    required double maxX,
    required double xInterval,
    required double? autoEnd,
    required double? teleopStart,
    required List<LineChartBarData> series,
    required double yMax,
    required double yInterval,
    required List<LineTooltipItem?> Function(List<LineBarSpot>) tooltip,
  }) {
    return LineChart(LineChartData(
      minX: 0, maxX: maxX, minY: 0, maxY: yMax,
      clipData: const FlClipData.all(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: yInterval,
        getDrawingHorizontalLine: (_) =>
            const FlLine(color: surfaceBorder, strokeWidth: 0.8),
      ),
      borderData: _border(),
      rangeAnnotations: _phaseRanges(autoEnd, teleopStart, maxX),
      extraLinesData: _phaseLines(autoEnd, teleopStart),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            interval: yInterval,
            getTitlesWidget: (v, _) => Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(v.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 8, color: labelDim)),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 14,
            interval: xInterval,
            getTitlesWidget: (v, _) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('${v.toInt()}s',
                  style: const TextStyle(fontSize: 8, color: labelDim)),
            ),
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: _touchData(tooltip),
      lineBarsData: series,
    ));
  }

  // ── Shared helpers ─────────────────────────────────────────────────────────

  FlBorderData _border() => FlBorderData(
    show: true,
    border: Border.all(color: surfaceBorder, width: 0.8),
  );

  RangeAnnotations _phaseRanges(double? autoEnd, double? teleopStart, double maxX) =>
      RangeAnnotations(verticalRangeAnnotations: [
        if (autoEnd != null)
          VerticalRangeAnnotation(
              x1: 0, x2: autoEnd,
              color: phasePreBlue.withValues(alpha: 0.07)),
        if (teleopStart != null)
          VerticalRangeAnnotation(
              x1: teleopStart, x2: maxX,
              color: phaseTeleopTeal.withValues(alpha: 0.07)),
      ]);

  ExtraLinesData _phaseLines(double? autoEnd, double? teleopStart) =>
      ExtraLinesData(verticalLines: [
        if (autoEnd != null)
          VerticalLine(x: autoEnd,
              color: phasePreBlue.withValues(alpha: 0.4),
              strokeWidth: 1, dashArray: [4, 4]),
        if (teleopStart != null)
          VerticalLine(x: teleopStart,
              color: phaseTeleopTeal.withValues(alpha: 0.4),
              strokeWidth: 1, dashArray: [4, 4]),
      ]);

  static const _tipStyle = TextStyle(
    fontSize: 9, color: labelDim, fontWeight: FontWeight.w600, height: 1.5);

  LineTouchData _touchData(
    List<LineTooltipItem?> Function(List<LineBarSpot>) tooltipBuilder,
  ) => LineTouchData(
    enabled: true,
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      fitInsideVertically: true,
      fitInsideHorizontally: true,
      getTooltipColor: (_) => surfaceBar,
      tooltipBorder: const BorderSide(color: surfaceBorder),
      tooltipRoundedRadius: 4,
      tooltipPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      getTooltipItems: tooltipBuilder,
    ),
    getTouchedSpotIndicator: (barData, indices) => indices.map((_) =>
      TouchedSpotIndicatorData(
        const FlLine(color: Colors.transparent, strokeWidth: 0),
        FlDotData(
          show: true,
          getDotPainter: (spot, _, bar, __) => FlDotCirclePainter(
            radius: 3,
            color: bar.color ?? labelDim,
            strokeWidth: 0,
            strokeColor: Colors.transparent,
          ),
        ),
      ),
    ).toList(),
  );

  // Single tooltip showing time once; all other series return null (no bubble).
  static List<LineTooltipItem?> _timeTooltip(List<LineBarSpot> spots) {
    if (spots.isEmpty) return [];
    return [
      LineTooltipItem('${spots.first.x.toStringAsFixed(1)}s', _tipStyle),
      for (int i = 1; i < spots.length; i++) null,
    ];
  }

  LineChartBarData _stepLine(List<FlSpot> spots, Color color,
      {bool dashed = false}) =>
      LineChartBarData(
        spots: spots,
        color: color,
        barWidth: 1.8,
        isCurved: false,
        isStepLineChart: true,
        dashArray: dashed ? [6, 4] : null,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      );

  LineChartBarData _line(List<FlSpot> spots, Color color) =>
      LineChartBarData(
        spots: spots,
        color: color,
        barWidth: 1.8,
        isCurved: false,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      );

  double _niceXInterval(double maxX) {
    for (final snap in [5.0, 10.0, 15.0, 20.0, 30.0, 60.0]) {
      if (maxX / snap <= 12) return snap;
    }
    return 30.0;
  }
}

// ─── Series label ─────────────────────────────────────────────────────────────

class _SeriesLabel extends StatelessWidget {
  final Color color;
  final String text;
  final bool dashed;

  const _SeriesLabel({
    required this.color,
    required this.text,
    this.dashed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Line indicator (solid or dashed)
        if (dashed) ...[
          Container(width: 4, height: 2, color: color),
          const SizedBox(width: 2),
          Container(width: 4, height: 2, color: color),
        ] else
          Container(width: 12, height: 2, color: color),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyle(
                fontSize: 9, fontWeight: FontWeight.w600, color: color)),
      ],
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _formatDate(DateTime dt) {
  const months = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  final h = dt.hour.toString().padLeft(2, '0');
  final m = dt.minute.toString().padLeft(2, '0');
  return '${months[dt.month]} ${dt.day}, $h:$m';
}

