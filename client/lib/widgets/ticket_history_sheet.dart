import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/pit_alert.dart';
import 'package:arena_link/models/settings.dart';
import 'package:arena_link/utils/logger.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart';

// ─── Show helper ──────────────────────────────────────────────────────────────

Future<void> showTicketHistory(
  BuildContext context, {
  required AppSettings settings,
  required int teamId,
  required String teamDisplay,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: surfaceCard,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => TicketHistorySheet(
      settings: settings,
      teamId: teamId,
      teamDisplay: teamDisplay,
    ),
  );
}

// ─── Data model (mirrors AlertSummary on server) ──────────────────────────────

class _AlertSummary {
  final PitAlertType alertType;
  final List<String> subIssues;
  final IssueStatus status;
  final String? actionBy;
  final String station;
  final String matchName;
  final String matchStateLabel;
  final String? fieldNotes;

  const _AlertSummary({
    required this.alertType,
    required this.subIssues,
    required this.status,
    this.actionBy,
    required this.station,
    required this.matchName,
    required this.matchStateLabel,
    this.fieldNotes,
  });

  factory _AlertSummary.fromJson(Map<String, dynamic> j) {
    return _AlertSummary(
      alertType: _parseType(j['alert_type'] as String? ?? ''),
      subIssues: (j['sub_issues'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      status: _parseStatus(j['status']),
      actionBy: j['action_by'] as String?,
      station: j['station'] as String? ?? '',
      matchName: j['match_name'] as String? ?? '',
      matchStateLabel: j['match_state_label'] as String? ?? '',
      fieldNotes: j['field_notes'] as String?,
    );
  }

  static PitAlertType _parseType(String s) {
    return PitAlertType.values.firstWhere(
      (t) => t.name.toLowerCase() == s.toLowerCase(),
      orElse: () => PitAlertType.custom,
    );
  }

  static IssueStatus _parseStatus(dynamic s) => switch (s) {
    'InProgress' || 'in_progress' => IssueStatus.inProgress,
    'Resolved'   || 'resolved'    => IssueStatus.resolved,
    _                              => IssueStatus.flagged,
  };
}

// ─── Sheet widget ─────────────────────────────────────────────────────────────

class TicketHistorySheet extends StatefulWidget {
  final AppSettings settings;
  final int teamId;
  final String teamDisplay;

  const TicketHistorySheet({
    super.key,
    required this.settings,
    required this.teamId,
    required this.teamDisplay,
  });

  @override
  State<TicketHistorySheet> createState() => _TicketHistorySheetState();
}

class _TicketHistorySheetState extends State<TicketHistorySheet> {
  late Future<List<_AlertSummary>> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetch();
  }

  Future<List<_AlertSummary>> _fetch() async {
    final uri = Uri(
      scheme: 'http',
      host: widget.settings.serverHost,
      port: widget.settings.serverPort,
      path: '/api/alerts/history/${widget.teamId}',
    );
    AppLogger().d('[TicketHistory] GET $uri');
    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode}: ${response.body}');
      }
      final list = jsonDecode(response.body) as List<dynamic>;
      final summaries = list
          .map((e) => _AlertSummary.fromJson(e as Map<String, dynamic>))
          .toList()
          .reversed
          .toList(); // newest first
      AppLogger().i('[TicketHistory] ${summaries.length} tickets for team ${widget.teamId}');
      return summaries;
    } catch (e, st) {
      AppLogger().e('[TicketHistory] Failed to fetch — $e\n$st');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // ── Handle ──
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: labelMuted.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // ── Header ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                children: [
                  Icon(Icons.history_rounded, size: 20, color: labelDim),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Ticket History — ${widget.teamDisplay}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: labelFaint,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh_rounded, size: 18, color: labelDim),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => setState(() { _future = _fetch(); }),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // ── Content ──
            Expanded(
              child: FutureBuilder<List<_AlertSummary>>(
                future: _future,
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snap.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Failed to load history.\nIs the ArenaLink server running?\n\n${snap.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: labelDim, fontSize: 12),
                        ),
                      ),
                    );
                  }
                  final alerts = snap.data!;
                  if (alerts.isEmpty) {
                    return Center(
                      child: Text(
                        'No tickets on record for this team.',
                        style: TextStyle(color: labelDim, fontSize: 13),
                      ),
                    );
                  }
                  return ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                    itemCount: alerts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) => _TicketCard(alert: alerts[i]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Individual ticket card ───────────────────────────────────────────────────

class _TicketCard extends StatelessWidget {
  final _AlertSummary alert;
  const _TicketCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    final (statusColor, statusIcon, statusLabel) = switch (alert.status) {
      IssueStatus.flagged    => (arenaAmber, Icons.flag_rounded,        'FLAGGED'),
      IssueStatus.inProgress => (arenaBlue,  Icons.engineering_rounded, 'WIP'),
      IssueStatus.resolved   => (arenaGreen, Icons.task_alt_rounded,    'RESOLVED'),
      IssueStatus.none       => (labelDim,   Icons.flag_outlined,       'UNKNOWN'),
    };

    return Container(
      decoration: BoxDecoration(
        color: surfaceBar,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: type + status badge ──
          Row(
            children: [
              Icon(alert.alertType.icon, size: 15, color: statusColor),
              const SizedBox(width: 6),
              Text(
                alert.alertType.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: labelFaint,
                  letterSpacing: 0.4,
                ),
              ),
              const Spacer(),
              Icon(statusIcon, size: 12, color: statusColor),
              const SizedBox(width: 4),
              Text(
                statusLabel,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: statusColor,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),

          // ── Match context ──
          if (alert.matchName.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              '${alert.matchName}${alert.matchStateLabel.isNotEmpty ? ' · ${alert.matchStateLabel}' : ''}'
              '  ·  ${alert.station}',
              style: TextStyle(fontSize: 10, color: labelDim),
            ),
          ],

          // ── Sub-issues ──
          if (alert.subIssues.isNotEmpty) ...[
            const SizedBox(height: 6),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: alert.subIssues
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: arenaAmber.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: arenaAmber.withValues(alpha: 0.25)),
                        ),
                        child: Text(
                          s,
                          style: TextStyle(
                              fontSize: 9,
                              color: arenaAmber,
                              fontWeight: FontWeight.w600),
                        ),
                      ))
                  .toList(),
            ),
          ],

          // ── Field notes ──
          if (alert.fieldNotes?.isNotEmpty == true) ...[
            const SizedBox(height: 6),
            Text(
              alert.fieldNotes!,
              style: TextStyle(fontSize: 10, color: labelDim),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          // ── Action by ──
          if (alert.actionBy != null) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.person_rounded, size: 11, color: labelMuted),
                const SizedBox(width: 3),
                Text(
                  switch (alert.status) {
                    IssueStatus.inProgress => 'Assigned by ${alert.actionBy}',
                    IssueStatus.resolved   => 'Resolved by ${alert.actionBy}',
                    _                      => 'Reopened by ${alert.actionBy}',
                  },
                  style: TextStyle(fontSize: 10, color: labelMuted),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
