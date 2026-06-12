// Generic, backend-agnostic arena models.
// All UI code imports from here. Backend-specific wire models live in
// lib/backends/<vendor>/models/ and are never seen by the UI layer.
//
// Design intent:
//   - One top-level [Arena] structure with three logical sub-sections.
//   - Each backend populates whatever fields it can from whatever endpoints
//     it has. Fields that a backend cannot provide keep their defaults.
//   - Adding a new backend = implement ArenaBackend, merge into Arena.
//     No new generic types needed.

// ═══════════════════════════════════════════════════════════════════════════════
// MATCH STATE CONSTANTS
// Integer values are intentionally identical to Cheesy Arena's iota ordering so
// the Cheesy backend needs no translation. Other backends must map to these.
// ═══════════════════════════════════════════════════════════════════════════════

abstract class MatchStateConst {
  static const int preMatch = 0;
  static const int startMatch = 1;
  static const int autoPeriod = 2;
  static const int pausePeriod = 3;
  static const int teleopPeriod = 4;
  static const int postMatch = 5;
  static const int timeoutActive = 6;
  static const int postTimeout = 7;
}

// ═══════════════════════════════════════════════════════════════════════════════
// BACKEND CONNECTION STATUS
// ═══════════════════════════════════════════════════════════════════════════════

enum BackendConnectionStatus { disconnected, connecting, connected, reconnecting }

// ═══════════════════════════════════════════════════════════════════════════════
// DS LINK  (driver station ↔ robot software connection)
// ═══════════════════════════════════════════════════════════════════════════════

class DsLink {
  final bool dsLinked;
  final bool rioLinked;
  final bool codeRunning; // robot code is loaded and running
  final bool radioLinked;
  final double batteryVoltage;
  final int tripTimeMs;
  final int missedPackets;

  const DsLink({
    required this.dsLinked,
    this.rioLinked = false,
    required this.codeRunning,
    required this.radioLinked,
    required this.batteryVoltage,
    required this.tripTimeMs,
    required this.missedPackets,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// RADIO LINK  (access point ↔ robot radio frequency link)
// ═══════════════════════════════════════════════════════════════════════════════

class RadioLink {
  final bool linked;
  final double bandwidth;
  final double signalNoiseRatio;
  final int connectionQuality; // 0–100 %

  const RadioLink({
    this.linked = false,
    this.bandwidth = 0.0,
    this.signalNoiseRatio = 0.0,
    this.connectionQuality = 0,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// STATION STATUS  (one per alliance station — R1/R2/R3/B1/B2/B3)
// ═══════════════════════════════════════════════════════════════════════════════

class StationStatus {
  // Team assigned to this station (null if empty / not yet loaded)
  final int? teamId;
  final String? teamName;
  final String? teamNickname;

  // Station flags
  final bool ethernet;
  final bool eStop;
  final bool aStop;
  final bool bypass;

  // DS software connection (null = DS not connected / no data yet)
  final DsLink? dsLink;

  // Radio frequency link
  final RadioLink radioLink;

  final String? gameData;

  const StationStatus({
    this.teamId,
    this.teamName,
    this.teamNickname,
    this.ethernet = false,
    this.eStop = false,
    this.aStop = false,
    this.bypass = false,
    this.dsLink,
    this.radioLink = const RadioLink(),
    this.gameData,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// HARDWARE STATE  (PLC, network devices, scoring panels)
// null for device status strings means "not configured in event settings".
// ═══════════════════════════════════════════════════════════════════════════════

class HardwareState {
  final bool plcHealthy;
  final bool plcEStop; // raw PLC value — only meaningful when plcHealthy
  final String? accessPointStatus; // null = not configured
  final String? switchStatus;
  final String? redSccStatus;
  final String? blueSccStatus;
  final Map<String, bool> armorBlocks; // PLC I/O block statuses

  // Scoring panel readiness
  final bool refereeReady;
  // Keys: "red_near" | "red_far" | "blue_near" | "blue_far" (or equivalent)
  final Map<String, ScoringPosition> scoringPositions;

  const HardwareState({
    this.plcHealthy = false,
    this.plcEStop = false,
    this.accessPointStatus,
    this.switchStatus,
    this.redSccStatus,
    this.blueSccStatus,
    this.armorBlocks = const {},
    this.refereeReady = false,
    this.scoringPositions = const {},
  });

  bool get fieldEStopActive => plcHealthy && plcEStop;
  bool get accessPointConfigured => accessPointStatus != null;
  bool get switchConfigured => switchStatus != null;
  bool get redSccConfigured => redSccStatus != null;
  bool get blueSccConfigured => blueSccStatus != null;
  bool get sccConfigured => redSccConfigured || blueSccConfigured;

  bool get allScoringReady {
    if (!refereeReady) return false;
    return scoringPositions.values.every((p) => p.numPanels == 0 || p.ready);
  }

  HardwareState copyWith({
    bool? plcHealthy,
    bool? plcEStop,
    Object? accessPointStatus = _sentinel,
    Object? switchStatus = _sentinel,
    Object? redSccStatus = _sentinel,
    Object? blueSccStatus = _sentinel,
    Map<String, bool>? armorBlocks,
    bool? refereeReady,
    Map<String, ScoringPosition>? scoringPositions,
  }) {
    return HardwareState(
      plcHealthy: plcHealthy ?? this.plcHealthy,
      plcEStop: plcEStop ?? this.plcEStop,
      accessPointStatus: accessPointStatus == _sentinel
          ? this.accessPointStatus
          : accessPointStatus as String?,
      switchStatus: switchStatus == _sentinel
          ? this.switchStatus
          : switchStatus as String?,
      redSccStatus: redSccStatus == _sentinel
          ? this.redSccStatus
          : redSccStatus as String?,
      blueSccStatus: blueSccStatus == _sentinel
          ? this.blueSccStatus
          : blueSccStatus as String?,
      armorBlocks: armorBlocks ?? this.armorBlocks,
      refereeReady: refereeReady ?? this.refereeReady,
      scoringPositions: scoringPositions ?? this.scoringPositions,
    );
  }
}

// Sentinel for nullable copyWith fields
const _sentinel = Object();

// ═══════════════════════════════════════════════════════════════════════════════
// SCORING POSITION  (one referee panel / scoring table position)
// ═══════════════════════════════════════════════════════════════════════════════

class ScoringPosition {
  final bool ready;
  final int numPanels;
  final int numPanelsReady;

  const ScoringPosition({
    this.ready = false,
    this.numPanels = 0,
    this.numPanelsReady = 0,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// FIELD MONITOR STATE  (everything the field monitor view needs)
// Updated from potentially many different backend endpoints/messages.
// Fields that a backend cannot provide keep their defaults.
// ═══════════════════════════════════════════════════════════════════════════════

class FieldMonitorState {
  // ── Match metadata ─────────────────────────────────────────────────────
  final int matchId;
  final String matchName; // e.g. "Qualification 12", "Practice 1"
  final DateTime? scheduledStart;

  // ── Match phase & timing ───────────────────────────────────────────────
  final int matchState; // see MatchStateConst
  final bool canStartMatch;
  final int matchTimeSec; // elapsed seconds within the current phase

  // Phase durations (seconds)
  final int autoDurationSec;
  final int pauseDurationSec;
  final int teleopDurationSec;

  // ── Alliance stations ──────────────────────────────────────────────────
  // Keys: R1, R2, R3, B1, B2, B3
  final Map<String, StationStatus> stations;

  // ── Field hardware & scoring panels ───────────────────────────────────
  final HardwareState hardware;

  // ── Live scores ────────────────────────────────────────────────────────
  final int? redScore;
  final int? blueScore;

  // ── Event / scheduling ────────────────────────────────────────────────
  // Raw strings from the backend — each backend formats these differently
  // and the UI parses them as needed.
  final String cycleTime; // e.g. "4:32 (0:15 faster than scheduled)"
  final String scheduleOffset; // e.g. "2 minutes late", "on schedule"

  // ── Display mode (from station display endpoint) ───────────────────────
  // "blank" | "match" | "logo" | "timeout" | "fieldReset" | "signalCount"
  final String? displayMode;

  const FieldMonitorState({
    this.matchId = 0,
    this.matchName = '',
    this.scheduledStart,
    this.matchState = MatchStateConst.preMatch,
    this.canStartMatch = false,
    this.matchTimeSec = 0,
    this.autoDurationSec = 15,
    this.pauseDurationSec = 3,
    this.teleopDurationSec = 135,
    this.stations = const {},
    this.hardware = const HardwareState(),
    this.redScore,
    this.blueScore,
    this.cycleTime = '',
    this.scheduleOffset = '',
    this.displayMode,
  });

  FieldMonitorState copyWith({
    int? matchId,
    String? matchName,
    Object? scheduledStart = _sentinel,
    int? matchState,
    bool? canStartMatch,
    int? matchTimeSec,
    int? autoDurationSec,
    int? pauseDurationSec,
    int? teleopDurationSec,
    Map<String, StationStatus>? stations,
    HardwareState? hardware,
    Object? redScore = _sentinel,
    Object? blueScore = _sentinel,
    String? cycleTime,
    String? scheduleOffset,
    Object? displayMode = _sentinel,
  }) {
    return FieldMonitorState(
      matchId: matchId ?? this.matchId,
      matchName: matchName ?? this.matchName,
      scheduledStart: scheduledStart == _sentinel
          ? this.scheduledStart
          : scheduledStart as DateTime?,
      matchState: matchState ?? this.matchState,
      canStartMatch: canStartMatch ?? this.canStartMatch,
      matchTimeSec: matchTimeSec ?? this.matchTimeSec,
      autoDurationSec: autoDurationSec ?? this.autoDurationSec,
      pauseDurationSec: pauseDurationSec ?? this.pauseDurationSec,
      teleopDurationSec: teleopDurationSec ?? this.teleopDurationSec,
      stations: stations ?? this.stations,
      hardware: hardware ?? this.hardware,
      redScore: redScore == _sentinel ? this.redScore : redScore as int?,
      blueScore: blueScore == _sentinel ? this.blueScore : blueScore as int?,
      cycleTime: cycleTime ?? this.cycleTime,
      scheduleOffset: scheduleOffset ?? this.scheduleOffset,
      displayMode:
          displayMode == _sentinel ? this.displayMode : displayMode as String?,
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// EVENT TEAM  (for the teams list page)
// ═══════════════════════════════════════════════════════════════════════════════

class EventTeam {
  final int id;
  final String name;
  final String nickname;
  final String city;
  final String stateProv;
  final String country;
  final bool yellowCard;
  final int? rank; // current qualification rank, null if not in quals

  const EventTeam({
    required this.id,
    required this.name,
    this.nickname = '',
    this.city = '',
    this.stateProv = '',
    this.country = '',
    this.yellowCard = false,
    this.rank,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// MATCH RECORD  (for the match log page)
// ═══════════════════════════════════════════════════════════════════════════════

enum MatchResult { notPlayed, redWon, blueWon, tie }

class MatchRecord {
  final int id;
  final String name;
  final DateTime? playedAt;
  // null entries = surrogate / no team assigned
  final List<int?> redTeams; // [R1, R2, R3]
  final List<int?> blueTeams; // [B1, B2, B3]
  final int? redScore;
  final int? blueScore;
  final MatchResult result;

  const MatchRecord({
    required this.id,
    required this.name,
    this.playedAt,
    this.redTeams = const [null, null, null],
    this.blueTeams = const [null, null, null],
    this.redScore,
    this.blueScore,
    this.result = MatchResult.notPlayed,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// ARENA  (top-level state — one instance for the whole app)
// ═══════════════════════════════════════════════════════════════════════════════

class Arena {
  /// Primary backend connection status.
  final BackendConnectionStatus connection;

  /// Live field state for the field monitor view.
  /// null = no data received yet (waiting for first backend message).
  final FieldMonitorState? field;

  /// All teams at this event.
  final List<EventTeam> teams;

  /// Completed / in-progress match results.
  final List<MatchRecord> matchLog;

  const Arena({
    this.connection = BackendConnectionStatus.disconnected,
    this.field,
    this.teams = const [],
    this.matchLog = const [],
  });

  Arena copyWith({
    BackendConnectionStatus? connection,
    Object? field = _sentinel,
    List<EventTeam>? teams,
    List<MatchRecord>? matchLog,
  }) {
    return Arena(
      connection: connection ?? this.connection,
      field: field == _sentinel ? this.field : field as FieldMonitorState?,
      teams: teams ?? this.teams,
      matchLog: matchLog ?? this.matchLog,
    );
  }
}
