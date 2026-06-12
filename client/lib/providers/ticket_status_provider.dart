import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/models/settings.dart';
import 'package:arena_link/providers/arena_provider.dart';
import 'package:arena_link/providers/issue_provider.dart';
import 'package:arena_link/providers/settings_provider.dart';
import 'package:arena_link/utils/logger.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart';

part 'ticket_status_provider.g.dart';

// ─── Ticket status WebSocket service ─────────────────────────────────────────
//
// Connects to ArenaLink server's /api/alerts/status WebSocket and translates
// TeamStatusUpdate messages into IssueStatus updates on issueStatusProvider.
//
// Race condition + team-rotation handling:
//   Messages are cached by team_id. On every arena state change (teams load,
//   match cycle, station swap) all station statuses are cleared and rebuilt
//   purely from the cache — so stale flags from a previous team never linger,
//   and snapshot messages that arrived before the arena loaded are applied
//   correctly once it becomes available.

@Riverpod(keepAlive: true)
class TicketStatusNotifier extends _$TicketStatusNotifier {
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _sub;
  Timer? _reconnectTimer;

  /// team_id → (status, open_count). The source of truth for all station flags.
  final Map<int, (IssueStatus, int)> _cache = {};

  @override
  void build() {
    final settings = ref.watch(appSettingsProvider);

    // Any arena change (teams load / station swap / match cycle) → rebuild.
    ref.listen<Arena>(arenaProvider, (_, next) => _applyCache(next));

    ref.onDispose(_disconnect);
    _connect(settings);
  }

  // ── Cache → providers ───────────────────────────────────────────────────────

  void _applyCache(Arena arena) {
    // Always wipe first so stale flags from the previous team assignment go away.
    ref.read(issueStatusProvider.notifier).clearAll();
    ref.read(openCountProvider.notifier).clearAll();

    final stations = arena.field?.stations;
    if (stations == null || stations.isEmpty) return;

    for (final entry in _cache.entries) {
      final stKey = _stationKey(stations, entry.key);
      if (stKey == null) continue;
      ref.read(issueStatusProvider.notifier).setStatus(stKey, entry.value.$1);
      ref.read(openCountProvider.notifier).setCount(stKey, entry.value.$2);
    }
  }

  // ── WebSocket connection ────────────────────────────────────────────────────

  void _connect(AppSettings settings) {
    _disconnect();

    final uri = Uri(
      scheme: 'ws',
      host: settings.serverHost,
      port: settings.serverPort,
      path: '/api/alerts/status',
    );

    try {
      _channel = WebSocketChannel.connect(uri);
      _sub = _channel!.stream
          .handleError((Object e) {
            AppLogger().w('[TicketStatus] Stream error — $e');
          })
          .listen(
            _onMessage,
            onDone: () => _scheduleReconnect(settings),
            cancelOnError: false,
          );
    } catch (e, st) {
      AppLogger().w('[TicketStatus] Failed to connect — $e\n$st');
      _scheduleReconnect(settings);
    }
  }

  void _disconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _sub?.cancel();
    _sub = null;
    _channel?.sink.close();
    _channel = null;
  }

  void _scheduleReconnect(AppSettings settings) {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(
      const Duration(seconds: 5),
      () => _connect(settings),
    );
  }

  // ── Message handling ────────────────────────────────────────────────────────

  void _onMessage(dynamic data) {
    if (data is! String) return;

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(data) as Map<String, dynamic>;
    } catch (e) {
      AppLogger().w('[TicketStatus] Bad message: $e');
      return;
    }

    final teamId    = json['team_id'];
    final statusStr = json['status'];
    final openCount = json['open_count'];
    if (teamId is! int || statusStr is! String) return;

    final issueStatus = _parseStatus(statusStr);
    final count       = openCount is int ? openCount : 0;

    // Update cache.
    if (issueStatus == IssueStatus.none) {
      _cache.remove(teamId);
    } else {
      _cache[teamId] = (issueStatus, count);
    }

    // Apply immediately if the arena mapping is already available.
    final stations = ref.read(arenaProvider).field?.stations;
    if (stations == null) return;

    final stKey = _stationKey(stations, teamId);
    if (stKey == null) return;

    ref.read(issueStatusProvider.notifier).setStatus(stKey, issueStatus);
    ref.read(openCountProvider.notifier).setCount(stKey, count);
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

  String? _stationKey(Map<String, StationStatus> stations, int teamId) {
    for (final e in stations.entries) {
      if (e.value.teamId == teamId) return e.key;
    }
    return null;
  }

  IssueStatus _parseStatus(String s) => switch (s) {
    'flagged'      => IssueStatus.flagged,
    'in_progress'  => IssueStatus.inProgress,
    'all_resolved' => IssueStatus.resolved,
    _              => IssueStatus.none,
  };
}
