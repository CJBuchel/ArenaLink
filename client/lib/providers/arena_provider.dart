import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arena_link/helpers/websocket_helper.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/providers/settings_provider.dart';

part 'arena_provider.g.dart';

// ─── ArenaNotifier ────────────────────────────────────────────────────────────
//
// Connects to the ArenaLink server WebSocket (/ws) and parses the ArenaState
// JSON the server broadcasts.
//
// Two connection layers:
//   1. Arena.connection  — Flutter ↔ ArenaLink server (tracked by WebSocketHelper)
//   2. Arena.fmsConnected — ArenaLink server ↔ FMS (from JSON field)
//
// Only layer 1 is managed here. Layer 2 comes from parsed JSON and never
// overwrites layer 1, so hovering Chrome (which fires AppLifecycleState.resumed)
// only triggers a reconnect if the server WS actually dropped.

@Riverpod(keepAlive: true)
class ArenaNotifier extends _$ArenaNotifier {
  WebSocketHelper? _ws;
  StreamSubscription<String>? _messageSub;
  StreamSubscription<WebSocketStatus>? _statusSub;

  @override
  Arena build() {
    final settings = ref.watch(appSettingsProvider);
    _initWs(settings.serverHost, settings.serverPort);

    // Only reconnect on app resume if the WS actually dropped.
    // On Flutter web, AppLifecycleState.resumed fires on every window focus
    // (including just mousing into Chrome). Checking .connection prevents
    // tearing down a healthy WebSocket on every hover.
    final observer = _LifecycleObserver(onResume: () {
      if (state.connection == BackendConnectionStatus.disconnected) {
        _ws?.reconnect();
      }
    });
    WidgetsBinding.instance.addObserver(observer);

    ref.onDispose(() {
      _messageSub?.cancel();
      _statusSub?.cancel();
      _ws?.dispose();
      WidgetsBinding.instance.removeObserver(observer);
    });

    return const Arena();
  }

  void _initWs(String host, int port) {
    _messageSub?.cancel();
    _statusSub?.cancel();
    _ws?.dispose();

    final url = 'ws://$host:$port/ws';
    _ws = WebSocketHelper(url: url);

    _messageSub = _ws!.messages.listen(_onMessage);
    _statusSub  = _ws!.status.listen(_onStatus);
    _ws!.connect();
  }

  // ── Status from WS layer (server connection) ──────────────────────────────

  void _onStatus(WebSocketStatus s) {
    final conn = switch (s) {
      WebSocketStatus.disconnected  => BackendConnectionStatus.disconnected,
      WebSocketStatus.connecting    => BackendConnectionStatus.connecting,
      WebSocketStatus.connected     => BackendConnectionStatus.connected,
      WebSocketStatus.reconnecting  => BackendConnectionStatus.reconnecting,
    };
    // Only update connection — don't touch field/teams/matchLog/fmsConnected.
    state = state.copyWith(connection: conn);
  }

  // ── Data from server JSON (FMS state) ─────────────────────────────────────

  void _onMessage(String raw) {
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      // Merge server payload into current state WITHOUT overwriting
      // Arena.connection (which reflects WS status, not FMS status).
      state = state.copyWith(
        fmsConnected: map['fmsConnected'] as bool? ?? false,
        field:        map['field'] != null
                          ? _parseField(map['field'] as Map<String, dynamic>)
                          : null,
        teams:    (map['teams'] as List<dynamic>? ?? [])
                      .map((t) => _parseTeam(t as Map<String, dynamic>))
                      .toList(),
        matchLog: (map['matchLog'] as List<dynamic>? ?? [])
                      .map((r) => _parseMatchRecord(r as Map<String, dynamic>))
                      .toList(),
      );
    } catch (e) {
      // ignore parse errors — stale fields keep previous values
    }
  }

  void reconnect() => _ws?.reconnect();
}

// ─── JSON parsing ─────────────────────────────────────────────────────────────
//
// Server sends camelCase (Rust serde rename_all = "camelCase").

FieldMonitorState _parseField(Map<String, dynamic> m) {
  final stationsRaw = m['stations'] as Map<String, dynamic>? ?? {};
  final hwRaw       = m['hardware'] as Map<String, dynamic>? ?? {};
  final timerRaw    = m['timer']    as Map<String, dynamic>? ?? {};

  return FieldMonitorState(
    matchId:       (m['matchId']       as num? ?? 0).toInt(),
    matchName:      m['matchName']     as String? ?? '',
    matchType:     (m['matchType']     as num? ?? 1).toInt(),
    matchState:    (m['matchState']    as num? ?? 0).toInt(),
    canStartMatch:  m['canStartMatch'] as bool? ?? false,
    matchTimeSec:  (m['matchTimeSec']  as num? ?? 0).toInt(),
    scheduledStart: m['scheduledStart'] != null
        ? DateTime.tryParse(m['scheduledStart'] as String)
        : null,
    timer: MatchPeriodTimer(
      periodLabel:    timerRaw['periodLabel']     as String? ?? '',
      countdownSec:   (timerRaw['countdownSec']   as num?)?.toInt(),
      periodTotalSec: (timerRaw['periodTotalSec'] as num?)?.toInt(),
    ),
    stations:      stationsRaw.map(
      (k, v) => MapEntry(k, _parseStation(v as Map<String, dynamic>)),
    ),
    hardware:      _parseHardware(hwRaw),
    redScore:      (m['redScore']      as num?)?.toInt(),
    blueScore:     (m['blueScore']     as num?)?.toInt(),
    cycleTime:      m['cycleTime']     as String? ?? '',
    scheduleOffset: m['scheduleOffset'] as String? ?? '',
    displayMode:    m['displayMode']   as String?,
  );
}

StationStatus _parseStation(Map<String, dynamic> m) {
  final dsRaw    = m['dsLink']    as Map<String, dynamic>?;
  final radioRaw = m['radioLink'] as Map<String, dynamic>? ?? {};

  return StationStatus(
    teamId:       (m['teamId']      as num?)?.toInt(),
    teamName:      m['teamName']    as String?,
    teamNickname:  m['teamNickname'] as String?,
    ethernet:      m['ethernet']    as bool? ?? false,
    eStop:         m['eStop']       as bool? ?? false,
    aStop:         m['aStop']       as bool? ?? false,
    bypass:        m['bypass']      as bool? ?? false,
    dsLink: dsRaw != null
        ? DsLink(
            dsLinked:       dsRaw['dsLinked']       as bool? ?? false,
            rioLinked:      dsRaw['rioLinked']       as bool? ?? false,
            codeRunning:    dsRaw['codeRunning']     as bool? ?? false,
            radioLinked:    dsRaw['radioLinked']     as bool? ?? false,
            batteryVoltage: (dsRaw['batteryVoltage'] as num? ?? 0).toDouble(),
            tripTimeMs:     (dsRaw['tripTimeMs']     as num? ?? 0).toInt(),
            missedPackets:  (dsRaw['missedPackets']  as num? ?? 0).toInt(),
          )
        : null,
    radioLink: RadioLink(
      linked:            radioRaw['linked']             as bool? ?? false,
      bandwidth:         (radioRaw['bandwidth']          as num? ?? 0).toDouble(),
      signalNoiseRatio:  (radioRaw['signalNoiseRatio']   as num? ?? 0).toDouble(),
      connectionQuality: (radioRaw['connectionQuality']  as num? ?? 0).toInt(),
    ),
    gameData: m['gameData'] as String?,
  );
}

HardwareState _parseHardware(Map<String, dynamic> m) {
  final armorRaw   = m['armorBlocks']       as Map<String, dynamic>? ?? {};
  final scoringRaw = m['scoringPositions']  as Map<String, dynamic>? ?? {};

  return HardwareState(
    plcHealthy:       m['plcHealthy']        as bool? ?? false,
    plcEStop:         m['plcEStop']          as bool? ?? false,
    accessPointStatus: m['accessPointStatus'] as String?,
    switchStatus:     m['switchStatus']       as String?,
    redSccStatus:     m['redSccStatus']       as String?,
    blueSccStatus:    m['blueSccStatus']       as String?,
    armorBlocks:      armorRaw.map((k, v) => MapEntry(k, v as bool)),
    refereeReady:     m['refereeReady']       as bool? ?? false,
    scoringPositions: scoringRaw.map(
      (k, v) {
        final sp = v as Map<String, dynamic>;
        return MapEntry(k, ScoringPosition(
          ready:          sp['ready']          as bool? ?? false,
          numPanels:      (sp['numPanels']     as num? ?? 0).toInt(),
          numPanelsReady: (sp['numPanelsReady'] as num? ?? 0).toInt(),
        ));
      },
    ),
  );
}

EventTeam _parseTeam(Map<String, dynamic> m) => EventTeam(
  id:         (m['id']        as num).toInt(),
  name:        m['name']      as String? ?? '',
  nickname:    m['nickname']  as String? ?? '',
  city:        m['city']      as String? ?? '',
  stateProv:   m['stateProv'] as String? ?? '',
  country:     m['country']   as String? ?? '',
  yellowCard:  m['yellowCard'] as bool? ?? false,
  rank:        (m['rank']     as num?)?.toInt(),
);

MatchRecord _parseMatchRecord(Map<String, dynamic> m) {
  List<int?> teams(dynamic raw) {
    if (raw is! List) return [null, null, null];
    return raw.map((v) => v != null ? (v as num).toInt() : null).toList();
  }

  return MatchRecord(
    id:        (m['id']  as num).toInt(),
    name:       m['name'] as String? ?? '',
    playedAt:   m['playedAt'] != null
                    ? DateTime.tryParse(m['playedAt'] as String)
                    : null,
    redTeams:  teams(m['redTeams']),
    blueTeams: teams(m['blueTeams']),
    redScore:  (m['redScore']  as num?)?.toInt(),
    blueScore: (m['blueScore'] as num?)?.toInt(),
    // Rust serializes enum variants as camelCase: "notPlayed", "redWon", etc.
    result: switch (m['result'] as String? ?? '') {
      'redWon'  => MatchResult.redWon,
      'blueWon' => MatchResult.blueWon,
      'tie'     => MatchResult.tie,
      _         => MatchResult.notPlayed,
    },
  );
}

// ─── Lifecycle observer ───────────────────────────────────────────────────────

class _LifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback onResume;
  _LifecycleObserver({required this.onResume});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) onResume();
  }
}
