import 'dart:async';
import 'dart:convert';

import 'package:arena_link/backends/arena_backend.dart';
import 'package:arena_link/backends/cheesy_arena/models/cheesy_arena_status.dart';
import 'package:arena_link/helpers/websocket_helper.dart';
import 'package:arena_link/models/arena_state.dart';

class CheesyArenaBackend implements ArenaBackend {
  WebSocketHelper? _ws;
  WebSocketHelper? _stationWs;
  WebSocketHelper? _refereeWs;

  // Cached match timing received from the 'matchTiming' websocket message.
  // Used to compute per-period countdowns from the elapsed matchTimeSec.
  // Cheesy Arena sends this once per match load; we keep the last known value.
  CheesyMatchTiming _timing = const CheesyMatchTiming();


  StreamSubscription<String>? _messageSub;
  StreamSubscription<WebSocketStatus>? _statusSub;
  StreamSubscription<String>? _stationMessageSub;
  StreamSubscription<String>? _refereeMessageSub;

  final _stateController = StreamController<Arena>.broadcast();
  Arena _arena = const Arena();

  @override
  Arena get state => _arena;

  @override
  Stream<Arena> get stateStream => _stateController.stream;

  void _update(Arena next) {
    _arena = next;
    _stateController.add(next);
  }

  // ─── ArenaBackend interface ───────────────────────────────────────────────

  @override
  void connect(String host, int port) {
    _ws = WebSocketHelper(
      url: 'ws://$host:$port/displays/field_monitor/websocket?displayId=5333',
    );
    _stationWs = WebSocketHelper(
      url: 'ws://$host:$port/displays/alliance_station/websocket?displayId=5334&station=R1',
    );
    _refereeWs = WebSocketHelper(
      url: 'ws://$host:$port/panels/referee/websocket',
    );

    _messageSub = _ws!.messages.listen(_onFieldMessage);
    _statusSub = _ws!.status.listen(_onStatus);
    _stationMessageSub = _stationWs!.messages.listen(_onStationMessage);
    _refereeMessageSub = _refereeWs!.messages.listen(_onRefereeMessage);

    _ws!.connect();
    _stationWs!.connect();
    _refereeWs!.connect();
  }

  @override
  void disconnect() {
    _ws?.disconnect();
    _stationWs?.disconnect();
    _refereeWs?.disconnect();
  }

  @override
  void reconnect() {
    _ws?.reconnect();
    _stationWs?.reconnect();
    _refereeWs?.reconnect();
  }

  @override
  void dispose() {
    _messageSub?.cancel();
    _statusSub?.cancel();
    _stationMessageSub?.cancel();
    _refereeMessageSub?.cancel();
    _ws?.dispose();
    _stationWs?.dispose();
    _refereeWs?.dispose();
    _stateController.close();
  }

  // ─── WebSocket handlers ───────────────────────────────────────────────────
  //
  // Each handler parses the Cheesy Arena wire format, then merges only the
  // fields it knows about into _arena using copyWith.  Fields from other
  // endpoints are left untouched.

  void _onFieldMessage(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return;
    try {
      final msg = ArenaMessage.fromJson(decoded);
      final data = msg.data;
      if (data is! Map<String, dynamic>) return;

      switch (msg.type) {
        case 'arenaStatus':
          _mergeArenaStatus(CheesyArenaStatus.fromJson(data));
        case 'matchLoad':
          _mergeMatchLoad(CheesyMatchLoad.fromJson(data));
        case 'matchTime':
          _mergeMatchTime(CheesyMatchTimeMessage.fromJson(data));
        case 'matchTiming':
          _timing = CheesyMatchTiming.fromJson(data);
        case 'eventStatus':
          _mergeEventStatus(CheesyEventStatus.fromJson(data));
        case 'realtimeScore':
          _mergeRealtimeScore(CheesyRealtimeScore.fromJson(data));
        default:
          break;
      }
    } catch (e) {
      print('[CheesyArenaBackend] parse error: $e\n$decoded');
    }
  }

  void _onStationMessage(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return;
    try {
      final msg = ArenaMessage.fromJson(decoded);
      if (msg.type == 'allianceStationDisplayMode' && msg.data is String) {
        final field = (_arena.field ?? const FieldMonitorState())
            .copyWith(displayMode: msg.data as String);
        _update(_arena.copyWith(field: field));
      }
    } catch (e) {
      print('[CheesyArenaBackend/station] parse error: $e');
    }
  }

  void _onRefereeMessage(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return;
    try {
      final msg = ArenaMessage.fromJson(decoded);
      final data = msg.data;
      if (data is! Map<String, dynamic>) return;

      if (msg.type == 'scoringStatus') {
        _mergeScoringStatus(CheesyScoringStatus.fromJson(data));
      }
    } catch (e) {
      print('[CheesyArenaBackend/referee] parse error: $e');
    }
  }

  void _onStatus(WebSocketStatus s) {
    _update(_arena.copyWith(connection: _mapConnection(s)));
  }

  // ─── Merge helpers ────────────────────────────────────────────────────────
  //
  // Each helper updates only the slice of FieldMonitorState it owns.
  // Other slices are preserved via copyWith.

  void _mergeArenaStatus(CheesyArenaStatus s) {
    final current = _arena.field ?? const FieldMonitorState();
    final field = current.copyWith(
      matchId: s.matchId,
      matchState: s.matchState,
      canStartMatch: s.canStartMatch,
      stations: _mergeStationsFromStatus(s, current.stations),
      hardware: current.hardware.copyWith(
        plcHealthy: s.plcIsHealthy,
        plcEStop: s.fieldEStop,
        accessPointStatus: s.accessPointStatus == 'UNKNOWN'
            ? null
            : s.accessPointStatus,
        switchStatus: s.switchStatus == 'UNKNOWN' ? null : s.switchStatus,
        redSccStatus: s.redSccStatus == 'UNKNOWN' ? null : s.redSccStatus,
        blueSccStatus: s.blueSccStatus == 'UNKNOWN' ? null : s.blueSccStatus,
        armorBlocks: s.plcArmorBlockStatuses ?? current.hardware.armorBlocks,
      ),
    );
    _update(_arena.copyWith(field: field));
  }

  void _mergeMatchLoad(CheesyMatchLoad s) {
    final current = _arena.field ?? const FieldMonitorState();
    // matchLoad carries the full team assignment per station — overlay on top of
    // whatever connection data we already have from arenaStatus.
    final updated = Map<String, StationStatus>.from(current.stations);
    for (final entry in s.teams.entries) {
      final key = entry.key;
      final team = entry.value;
      final existing = updated[key] ?? const StationStatus();
      updated[key] = StationStatus(
        teamId: team?.id,
        teamName: team?.name,
        teamNickname: team?.nickname,
        ethernet: existing.ethernet,
        eStop: existing.eStop,
        aStop: existing.aStop,
        bypass: existing.bypass,
        dsLink: existing.dsLink,
        radioLink: existing.radioLink,
        gameData: existing.gameData,
      );
    }
    final field = current.copyWith(
      matchId: s.match.id,
      matchName: s.match.shortName,
      matchType: s.match.type,
      scheduledStart: _normalizeScheduledTime(s.match.scheduledStartTime),
      stations: updated,
    );
    _update(_arena.copyWith(field: field));
  }

  void _mergeMatchTime(CheesyMatchTimeMessage s) {
    final current = _arena.field ?? const FieldMonitorState();
    final field = current.copyWith(
      matchState: s.matchState,
      matchTimeSec: s.matchTimeSec,
      timer: _computeTimer(s.matchState, s.matchTimeSec),
    );
    _update(_arena.copyWith(field: field));
  }

  /// Compute a generic [MatchPeriodTimer] from the stored [_timing] phase
  /// durations and the cumulative [elapsedSec] from match start.
  ///
  /// Cheesy Arena's [matchTimeSec] is `time.Since(matchStartTime)` — a
  /// continuous counter from the moment the match started, not a per-phase
  /// counter.  Countdowns are therefore derived from phase-boundary absolute
  /// times, not from the raw elapsed value.
  ///
  /// Teleop duration: Cheesy Arena computes it as
  ///   `TransitionShift + 4 × Shift + Endgame`
  /// (the Shift sub-period repeats four times in the current game).
  MatchPeriodTimer _computeTimer(int matchState, int elapsedSec) {
    final t = _timing;
    final autoEnd = t.autoDurationSec;
    final pauseEnd = autoEnd + t.pauseDurationSec;
    // Mirror game.GetTeleopDurationSec() from cheesy-arena/game/match_timing.go
    final teleopDuration =
        t.transitionShiftDurationSec + 4 * t.shiftDurationSec + t.endgameDurationSec;
    final teleopEnd = pauseEnd + teleopDuration;

    return switch (matchState) {
      MatchStateConst.autoPeriod => MatchPeriodTimer(
        periodLabel: 'AUTO',
        countdownSec: (autoEnd - elapsedSec).clamp(0, autoEnd),
        periodTotalSec: autoEnd,
      ),
      MatchStateConst.pausePeriod => MatchPeriodTimer(
        periodLabel: 'PAUSE',
        countdownSec: (pauseEnd - elapsedSec).clamp(0, t.pauseDurationSec),
        periodTotalSec: t.pauseDurationSec,
      ),
      MatchStateConst.teleopPeriod => MatchPeriodTimer(
        periodLabel: 'TELEOP',
        countdownSec: (teleopEnd - elapsedSec).clamp(0, teleopDuration),
        periodTotalSec: teleopDuration,
      ),
      _ => const MatchPeriodTimer(),
    };
  }

  void _mergeEventStatus(CheesyEventStatus s) {
    final current = _arena.field ?? const FieldMonitorState();
    final field = current.copyWith(
      cycleTime: s.cycleTime,
      scheduleOffset: s.earlyLateMessage,
    );
    _update(_arena.copyWith(field: field));
  }

  void _mergeRealtimeScore(CheesyRealtimeScore s) {
    final current = _arena.field ?? const FieldMonitorState();
    final field = current.copyWith(
      redScore: s.red.scoreSummary.score,
      blueScore: s.blue.scoreSummary.score,
      matchState: s.matchState,
    );
    _update(_arena.copyWith(field: field));
  }

  void _mergeScoringStatus(CheesyScoringStatus s) {
    final current = _arena.field ?? const FieldMonitorState();
    final field = current.copyWith(
      hardware: current.hardware.copyWith(
        refereeReady: s.refereeScoreReady,
        scoringPositions: s.positionStatuses.map(
          (k, v) => MapEntry(
            k,
            ScoringPosition(
              ready: v.ready,
              numPanels: v.numPanels,
              numPanelsReady: v.numPanelsReady,
            ),
          ),
        ),
      ),
    );
    _update(_arena.copyWith(field: field));
  }

  // ─── Station merging ──────────────────────────────────────────────────────
  //
  // arenaStatus carries live DS/wifi/team data per station.
  // matchLoad carries team assignments.
  // Both update stations without clobbering what the other set.

  static Map<String, StationStatus> _mergeStationsFromStatus(
    CheesyArenaStatus s,
    Map<String, StationStatus> existing,
  ) {
    final result = Map<String, StationStatus>.from(existing);
    for (final entry in s.allianceStations.entries) {
      final key = entry.key;
      final cs = entry.value;
      final prev = existing[key];
      result[key] = StationStatus(
        // Preserve team info from matchLoad if arenaStatus doesn't have it yet
        teamId: cs.team?.id ?? prev?.teamId,
        teamName: cs.team?.name ?? prev?.teamName,
        teamNickname: cs.team?.nickname ?? prev?.teamNickname,
        ethernet: cs.ethernet,
        eStop: cs.eStop,
        aStop: cs.aStop,
        bypass: cs.bypass,
        dsLink: cs.dsConn != null ? _mapDsLink(cs.dsConn!) : null,
        radioLink: _mapRadioLink(cs.wifiStatus),
        gameData: cs.gameData.isNotEmpty ? cs.gameData : null,
      );
    }
    return result;
  }

  static DsLink _mapDsLink(CheesyDsConnection ds) => DsLink(
    dsLinked: ds.dsLinked,
    rioLinked: ds.rioLinked,
    codeRunning: ds.robotLinked,
    radioLinked: ds.radioLinked,
    batteryVoltage: ds.batteryVoltage,
    tripTimeMs: ds.dsRobotTripTimeMs,
    missedPackets: ds.missedPacketCount,
  );

  static RadioLink _mapRadioLink(CheesyWifiStatus w) => RadioLink(
    linked: w.radioLinked,
    bandwidth: w.mBits,
    signalNoiseRatio: w.signalNoiseRatio,
    connectionQuality: w.connectionQuality,
  );

  /// Pass the raw UTC DateTime through unchanged.
  /// The UI layer applies the user-configured timezone offset for display and
  /// compares in UTC for the schedule-delta calculation.
  static DateTime? _normalizeScheduledTime(DateTime? raw) => raw;

  static BackendConnectionStatus _mapConnection(WebSocketStatus s) =>
      switch (s) {
        WebSocketStatus.disconnected => BackendConnectionStatus.disconnected,
        WebSocketStatus.connecting => BackendConnectionStatus.connecting,
        WebSocketStatus.connected => BackendConnectionStatus.connected,
        WebSocketStatus.reconnecting => BackendConnectionStatus.reconnecting,
      };
}
