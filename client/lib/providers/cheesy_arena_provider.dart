import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arena_link/helpers/websocket_helper.dart';
import 'package:arena_link/models/arena_status.dart';

part 'cheesy_arena_provider.g.dart';

const _defaultHost = 'localhost'; // localhost or 10.0.100.5
const _defaultPort = 8080;

@Riverpod(keepAlive: true)
class CheesyArena extends _$CheesyArena {
  late final WebSocketHelper _ws;
  StreamSubscription<String>? _messageSub;
  StreamSubscription<WebSocketStatus>? _statusSub;

  String get _url =>
      'ws://$_defaultHost:$_defaultPort/displays/field_monitor/websocket?displayId=5333';

  @override
  CheesyArenaState build() {
    _ws = WebSocketHelper(url: _url);

    _messageSub = _ws.messages.listen(_onMessage);
    _statusSub = _ws.status.listen(_onStatus);

    ref.onDispose(() {
      _messageSub?.cancel();
      _statusSub?.cancel();
      _ws.dispose();
    });

    _ws.connect();

    return const CheesyArenaState();
  }

  void _onMessage(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return;
    try {
      final msg = ArenaMessage.fromJson(decoded);
      final data = msg.data;

      switch (msg.type) {
        case 'arenaStatus':
          state = state.copyWith(arenaStatus: ArenaStatus.fromJson(data));
        case 'eventStatus':
          if (data is Map<String, dynamic>) {
            state = state.copyWith(eventStatus: EventStatus.fromJson(data));
          }
        case 'matchTime':
          if (data is Map<String, dynamic>) {
            state = state.copyWith(matchTime: MatchTimeMessage.fromJson(data));
          }
        default:
          break;
      }
    } catch (e) {
      print('[ArenaProvider] parse error: $e\n$decoded');
    }
  }

  void _onStatus(WebSocketStatus s) {
    state = state.copyWith(wsStatus: s);
  }

  void reconnect() {
    _ws.disconnect();
    _ws.connect();
  }
}

class CheesyArenaState {
  final ArenaStatus? arenaStatus;
  final EventStatus? eventStatus;
  final MatchTimeMessage? matchTime;
  final WebSocketStatus wsStatus;

  const CheesyArenaState({
    this.arenaStatus,
    this.eventStatus,
    this.matchTime,
    this.wsStatus = WebSocketStatus.disconnected,
  });

  CheesyArenaState copyWith({
    ArenaStatus? arenaStatus,
    EventStatus? eventStatus,
    MatchTimeMessage? matchTime,
    WebSocketStatus? wsStatus,
  }) {
    return CheesyArenaState(
      arenaStatus: arenaStatus ?? this.arenaStatus,
      eventStatus: eventStatus ?? this.eventStatus,
      matchTime: matchTime ?? this.matchTime,
      wsStatus: wsStatus ?? this.wsStatus,
    );
  }
}
