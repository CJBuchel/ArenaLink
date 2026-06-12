import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:arena_link/models/pit_alert.dart';
import 'package:arena_link/models/settings.dart';
import 'package:arena_link/utils/logger.dart';

/// POST a pit alert to the ArenaLink server.
///
/// Throws on network error or non-2xx response so the caller can show
/// an error message to the operator.
Future<void> postAlert(AppSettings settings, PitAlertSubmission submission) async {
  final uri = Uri(
    scheme: 'http',
    host: settings.serverHost,
    port: settings.serverPort,
    path: '/api/alerts',
  );

  final ctx = submission.context;

  final body = <String, dynamic>{
    'station': ctx.stationLabel,
    'alert_type': submission.alertType.name,
    if (ctx.teamId != null) 'team_id': ctx.teamId,
    if (ctx.teamName != null) 'team_name': ctx.teamName,
    if (submission.subIssues.isNotEmpty) 'sub_issues': submission.subIssues,
    if (submission.recipients.isNotEmpty)
      'recipients': submission.recipients.map((r) => r.name).toList(),
    if (submission.fieldNotes?.isNotEmpty == true) 'field_notes': submission.fieldNotes,
    if (ctx.matchName.isNotEmpty) 'match_name': ctx.matchName,
    if (ctx.matchTypeLabel.isNotEmpty) 'match_type_label': ctx.matchTypeLabel,
    if (ctx.matchStateLabel.isNotEmpty) 'match_state_label': ctx.matchStateLabel,
    if (ctx.timeRemainingSec != null) 'time_remaining_sec': ctx.timeRemainingSec,
    if (ctx.scheduledStart != null) 'scheduled_start': ctx.scheduledStart,
  };

  AppLogger().i('[Alert] POST $uri — station=${ctx.stationLabel} '
      'type=${submission.alertType.name} team=${ctx.teamId}');

  try {
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      AppLogger().e(
        '[Alert] Server returned ${response.statusCode}: ${response.body}',
      );
      throw Exception(
        'Alert submission failed (HTTP ${response.statusCode}): ${response.body}',
      );
    }

    AppLogger().i('[Alert] Posted successfully (${response.statusCode})');
  } catch (e, st) {
    AppLogger().e('[Alert] Failed to POST to $uri — $e\n$st');
    rethrow;
  }
}
