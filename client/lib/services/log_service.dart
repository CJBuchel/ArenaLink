import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:arena_link/utils/logger.dart';

// ─── Match log row ────────────────────────────────────────────────────────────
//
// One tick of per-robot telemetry from a match log.
// Field names mirror the ArenaLink server's MatchLogEntry JSON keys.

class MatchLogRow {
  final double matchTimeSec;
  final bool auto;           // arena-commanded auto
  final bool enabled;        // arena-commanded enabled
  final bool dsAuto;         // DS-reported auto mode
  final bool dsEnabled;      // DS-reported enabled state
  final double voltage;      // batteryVoltage (V)
  final double rxRate;       // rxRateMbps — downlink bandwidth
  final double txRate;       // txRateMbps — uplink bandwidth
  final int missedPackets;
  final bool dsLinked;
  final bool radioLinked;
  final bool rioLinked;
  final bool robotLinked;
  final bool ethernet;       // ethernetLinked

  const MatchLogRow({
    required this.matchTimeSec,
    required this.auto,
    required this.enabled,
    required this.voltage,
    required this.rxRate,
    required this.txRate,
    required this.missedPackets,
    this.dsAuto = false,
    this.dsEnabled = false,
    this.dsLinked = false,
    this.radioLinked = false,
    this.rioLinked = false,
    this.robotLinked = false,
    this.ethernet = false,
  });

  factory MatchLogRow.fromJson(Map<String, dynamic> json) => MatchLogRow(
    matchTimeSec:  (json['matchTimeSec']  as num?)?.toDouble() ?? 0.0,
    auto:           json['auto']           as bool? ?? false,
    enabled:        json['enabled']        as bool? ?? false,
    dsAuto:         json['dsAuto']         as bool? ?? false,
    dsEnabled:      json['dsEnabled']      as bool? ?? false,
    voltage:       (json['batteryVoltage'] as num?)?.toDouble() ?? 0.0,
    rxRate:        (json['rxRateMbps']     as num?)?.toDouble() ?? 0.0,
    txRate:        (json['txRateMbps']     as num?)?.toDouble() ?? 0.0,
    missedPackets: (json['missedPackets']  as num?)?.toInt()    ?? 0,
    dsLinked:       json['dsLinked']       as bool? ?? false,
    radioLinked:    json['radioLinked']    as bool? ?? false,
    rioLinked:      json['rioLinked']      as bool? ?? false,
    robotLinked:    json['robotLinked']    as bool? ?? false,
    ethernet:       json['ethernetLinked'] as bool? ?? false,
  );
}

// ─── Log service ──────────────────────────────────────────────────────────────
//
// Fetches per-robot match telemetry from the ArenaLink server.
//
// API:  GET /api/arena/logs?match=<shortName>&team=<teamId>
// Returns: JSON array of MatchLogEntry objects (ArenaLink's own structure).
//
// All vendor-specific details (Cheesy Arena CSV format, file naming, etc.) are
// handled server-side. This service only speaks ArenaLink's own protocol.

class LogService {
  final String serverHost;
  final int serverPort;

  const LogService({required this.serverHost, required this.serverPort});

  Uri _uri(String path, Map<String, String> query) => Uri(
    scheme: 'http',
    host: serverHost,
    port: serverPort,
    path: path,
    queryParameters: query,
  );

  Future<List<MatchLogRow>> fetchLogForTeam(
    String matchShortName,
    int teamId,
  ) async {
    final uri = _uri('/api/arena/logs', {
      'match': matchShortName,
      'team':  teamId.toString(),
    });

    AppLogger().d('[LogService] GET $uri');

    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode} from /api/arena/logs');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) throw Exception('Unexpected /api/arena/logs response');

    final rows = decoded
        .cast<Map<String, dynamic>>()
        .map(MatchLogRow.fromJson)
        .toList();

    AppLogger().i('[LogService] Received ${rows.length} log entries');
    return rows;
  }
}
