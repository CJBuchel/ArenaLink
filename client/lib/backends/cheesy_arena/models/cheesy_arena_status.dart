// Cheesy Arena–specific wire models.
// These are internal to the Cheesy Arena backend and must NOT be imported by UI code.
// All class names are prefixed with "Cheesy" where they would otherwise conflict
// with the generic models in lib/models/arena_state.dart.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cheesy_arena_status.freezed.dart';
part 'cheesy_arena_status.g.dart';

double _numToDouble(dynamic v) => (v as num).toDouble();

// ═══════════════════════════════════════════════════════════════════════════════
// CHEESY ARENA–SPECIFIC CONSTANTS
// ═══════════════════════════════════════════════════════════════════════════════

abstract class MatchTypeConst {
  static const int test = 0;
  static const int practice = 1;
  static const int qualification = 2;
  static const int playoff = 3;
}

abstract class MatchStatusConst {
  static const int scheduled = 0;
  static const int hidden = 1;
  static const int redWon = 2;
  static const int blueWon = 3;
  static const int tie = 4;
}

// 2025 REEFSCAPE — update for new game each season
abstract class EndgameStatusConst {
  static const int none = 0;
  static const int parked = 1;
  static const int shallowCage = 2;
  static const int deepCage = 3;
}

// ═══════════════════════════════════════════════════════════════════════════════
// ENVELOPE
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class ArenaMessage with _$ArenaMessage {
  const factory ArenaMessage({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'data') required dynamic data,
  }) = _ArenaMessage;

  factory ArenaMessage.fromJson(Map<String, dynamic> json) =>
      _$ArenaMessageFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// ARENA STATUS
// Source: field/arena_notifiers.go generateArenaStatusMessage()
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyArenaStatus with _$CheesyArenaStatus {
  const factory CheesyArenaStatus({
    @JsonKey(name: 'MatchId') required int matchId,
    @JsonKey(name: 'AllianceStations')
    required Map<String, CheesyAllianceStation> allianceStations,
    @JsonKey(name: 'MatchState') required int matchState,
    @JsonKey(name: 'CanStartMatch') required bool canStartMatch,
    @JsonKey(name: 'PlcIsHealthy') required bool plcIsHealthy,
    @JsonKey(name: 'FieldEStop') required bool fieldEStop,
    @JsonKey(name: 'AccessPointStatus') @Default('UNKNOWN') String accessPointStatus,
    @JsonKey(name: 'SwitchStatus') @Default('UNKNOWN') String switchStatus,
    @JsonKey(name: 'RedSCCStatus') @Default('UNKNOWN') String redSccStatus,
    @JsonKey(name: 'BlueSCCStatus') @Default('UNKNOWN') String blueSccStatus,
    @JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses,
  }) = _CheesyArenaStatus;

  factory CheesyArenaStatus.fromJson(Map<String, dynamic> json) =>
      _$CheesyArenaStatusFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// EVENT STATUS
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyEventStatus with _$CheesyEventStatus {
  const factory CheesyEventStatus({
    @JsonKey(name: 'CycleTime') @Default('') String cycleTime,
    @JsonKey(name: 'EarlyLateMessage') @Default('') String earlyLateMessage,
  }) = _CheesyEventStatus;

  factory CheesyEventStatus.fromJson(Map<String, dynamic> json) =>
      _$CheesyEventStatusFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// MATCH TIME
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyMatchTimeMessage with _$CheesyMatchTimeMessage {
  const factory CheesyMatchTimeMessage({
    @JsonKey(name: 'MatchState') required int matchState,
    @JsonKey(name: 'MatchTimeSec') required int matchTimeSec,
  }) = _CheesyMatchTimeMessage;

  factory CheesyMatchTimeMessage.fromJson(Map<String, dynamic> json) =>
      _$CheesyMatchTimeMessageFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// MATCH TIMING
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyMatchTiming with _$CheesyMatchTiming {
  const factory CheesyMatchTiming({
    @JsonKey(name: 'WarmupDurationSec') @Default(0) int warmupDurationSec,
    @JsonKey(name: 'AutoDurationSec') @Default(15) int autoDurationSec,
    @JsonKey(name: 'PauseDurationSec') @Default(3) int pauseDurationSec,
    @JsonKey(name: 'TeleopDurationSec') @Default(135) int teleopDurationSec,
    @JsonKey(name: 'WarningRemainingDurationSec') @Default(20) int warningRemainingDurationSec,
    @JsonKey(name: 'TimeoutDurationSec') @Default(0) int timeoutDurationSec,
  }) = _CheesyMatchTiming;

  factory CheesyMatchTiming.fromJson(Map<String, dynamic> json) =>
      _$CheesyMatchTimingFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// MATCH LOAD
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyMatchLoad with _$CheesyMatchLoad {
  const factory CheesyMatchLoad({
    @JsonKey(name: 'Match') required CheesyMatch match,
    @JsonKey(name: 'AllowSubstitution') @Default(false) bool allowSubstitution,
    @JsonKey(name: 'IsReplay') @Default(false) bool isReplay,
    @JsonKey(name: 'Teams') required Map<String, CheesyTeam?> teams,
    @JsonKey(name: 'Rankings') @Default({}) Map<String, int> rankings,
    @JsonKey(name: 'BreakDescription') @Default('') String breakDescription,
    @JsonKey(name: 'Matchup') dynamic matchup,
  }) = _CheesyMatchLoad;

  factory CheesyMatchLoad.fromJson(Map<String, dynamic> json) =>
      _$CheesyMatchLoadFromJson(json);
}

@freezed
abstract class CheesyMatch with _$CheesyMatch {
  const factory CheesyMatch({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'TypeOrder') @Default(0) int typeOrder,
    @JsonKey(name: 'LongName') @Default('') String longName,
    @JsonKey(name: 'ShortName') @Default('') String shortName,
    @JsonKey(name: 'NameDetail') @Default('') String nameDetail,
    @JsonKey(name: 'PlayoffMatchGroupId') @Default('') String playoffMatchGroupId,
    @JsonKey(name: 'PlayoffRedAlliance') @Default(0) int playoffRedAlliance,
    @JsonKey(name: 'PlayoffBlueAlliance') @Default(0) int playoffBlueAlliance,
    @JsonKey(name: 'Red1') @Default(0) int red1,
    @JsonKey(name: 'Red1IsSurrogate') @Default(false) bool red1IsSurrogate,
    @JsonKey(name: 'Red2') @Default(0) int red2,
    @JsonKey(name: 'Red2IsSurrogate') @Default(false) bool red2IsSurrogate,
    @JsonKey(name: 'Red3') @Default(0) int red3,
    @JsonKey(name: 'Red3IsSurrogate') @Default(false) bool red3IsSurrogate,
    @JsonKey(name: 'Blue1') @Default(0) int blue1,
    @JsonKey(name: 'Blue1IsSurrogate') @Default(false) bool blue1IsSurrogate,
    @JsonKey(name: 'Blue2') @Default(0) int blue2,
    @JsonKey(name: 'Blue2IsSurrogate') @Default(false) bool blue2IsSurrogate,
    @JsonKey(name: 'Blue3') @Default(0) int blue3,
    @JsonKey(name: 'Blue3IsSurrogate') @Default(false) bool blue3IsSurrogate,
    @JsonKey(name: 'Status') @Default(0) int status,
    @JsonKey(name: 'ScheduledStartTime') DateTime? scheduledStartTime,
  }) = _CheesyMatch;

  factory CheesyMatch.fromJson(Map<String, dynamic> json) =>
      _$CheesyMatchFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// ALLIANCE STATION / DS / WIFI
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyAllianceStation with _$CheesyAllianceStation {
  const factory CheesyAllianceStation({
    @JsonKey(name: 'DsConn') CheesyDsConnection? dsConn,
    @JsonKey(name: 'Ethernet') required bool ethernet,
    @JsonKey(name: 'AStop') required bool aStop,
    @JsonKey(name: 'EStop') required bool eStop,
    @JsonKey(name: 'Bypass') required bool bypass,
    @JsonKey(name: 'Team') CheesyTeam? team,
    @JsonKey(name: 'WifiStatus') required CheesyWifiStatus wifiStatus,
    @JsonKey(name: 'GameData') @Default('') String gameData,
  }) = _CheesyAllianceStation;

  factory CheesyAllianceStation.fromJson(Map<String, dynamic> json) =>
      _$CheesyAllianceStationFromJson(json);
}

@freezed
abstract class CheesyWifiStatus with _$CheesyWifiStatus {
  const factory CheesyWifiStatus({
    @JsonKey(name: 'TeamId') required int teamId,
    @JsonKey(name: 'RadioLinked') required bool radioLinked,
    @JsonKey(name: 'MBits', fromJson: _numToDouble) @Default(0.0) double mBits,
    @JsonKey(name: 'RxRate', fromJson: _numToDouble) @Default(0.0) double rxRate,
    @JsonKey(name: 'TxRate', fromJson: _numToDouble) @Default(0.0) double txRate,
    @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) @Default(0.0) double signalNoiseRatio,
    @JsonKey(name: 'ConnectionQuality') @Default(0) int connectionQuality,
  }) = _CheesyWifiStatus;

  factory CheesyWifiStatus.fromJson(Map<String, dynamic> json) =>
      _$CheesyWifiStatusFromJson(json);
}

@freezed
abstract class CheesyDsConnection with _$CheesyDsConnection {
  const factory CheesyDsConnection({
    @JsonKey(name: 'DsLinked') required bool dsLinked,
    @JsonKey(name: 'RioLinked') @Default(false) bool rioLinked,
    @JsonKey(name: 'RobotLinked') required bool robotLinked,
    @JsonKey(name: 'RadioLinked') required bool radioLinked,
    @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) required double batteryVoltage,
    @JsonKey(name: 'DsRobotTripTimeMs') required int dsRobotTripTimeMs,
    @JsonKey(name: 'MissedPacketCount') required int missedPacketCount,
  }) = _CheesyDsConnection;

  factory CheesyDsConnection.fromJson(Map<String, dynamic> json) =>
      _$CheesyDsConnectionFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// TEAM
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyTeam with _$CheesyTeam {
  const factory CheesyTeam({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Nickname') @Default('') String nickname,
    @JsonKey(name: 'City') @Default('') String city,
    @JsonKey(name: 'StateProv') @Default('') String stateProv,
    @JsonKey(name: 'Country') @Default('') String country,
    @JsonKey(name: 'SchoolName') @Default('') String schoolName,
    @JsonKey(name: 'RookieYear') @Default(0) int rookieYear,
    @JsonKey(name: 'RobotName') @Default('') String robotName,
    @JsonKey(name: 'YellowCard') @Default(false) bool yellowCard,
    @JsonKey(name: 'HasConnected') @Default(false) bool hasConnected,
    @JsonKey(name: 'FtaNotes') @Default('') String ftaNotes,
  }) = _CheesyTeam;

  factory CheesyTeam.fromJson(Map<String, dynamic> json) =>
      _$CheesyTeamFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// REALTIME SCORE
// NOTE: GameScore and Reef are 2025 REEFSCAPE-specific — update each season.
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyRealtimeScore with _$CheesyRealtimeScore {
  const factory CheesyRealtimeScore({
    @JsonKey(name: 'Red') required CheesyAllianceScore red,
    @JsonKey(name: 'Blue') required CheesyAllianceScore blue,
    @JsonKey(name: 'RedCards') @Default({}) Map<String, String> redCards,
    @JsonKey(name: 'BlueCards') @Default({}) Map<String, String> blueCards,
    @JsonKey(name: 'MatchState') @Default(0) int matchState,
  }) = _CheesyRealtimeScore;

  factory CheesyRealtimeScore.fromJson(Map<String, dynamic> json) =>
      _$CheesyRealtimeScoreFromJson(json);
}

@freezed
abstract class CheesyAllianceScore with _$CheesyAllianceScore {
  const factory CheesyAllianceScore({
    @JsonKey(name: 'Score') @Default({}) Map<String, dynamic> score,
    @JsonKey(name: 'ScoreSummary') required CheesyScoreSummary scoreSummary,
    @JsonKey(name: 'ActiveRemainingSec') @Default(0) int activeRemainingSec,
    @JsonKey(name: 'ActiveDurationSec') @Default(0) int activeDurationSec,
  }) = _CheesyAllianceScore;

  factory CheesyAllianceScore.fromJson(Map<String, dynamic> json) =>
      _$CheesyAllianceScoreFromJson(json);
}

/// 2025 REEFSCAPE live score — update each season.
@freezed
abstract class CheesyGameScore with _$CheesyGameScore {
  const factory CheesyGameScore({
    @JsonKey(name: 'RobotsBypassed') required List<bool> robotsBypassed,
    @JsonKey(name: 'LeaveStatuses') required List<bool> leaveStatuses,
    @JsonKey(name: 'Reef') required CheesyReef reef,
    @JsonKey(name: 'BargeAlgae') @Default(0) int bargeAlgae,
    @JsonKey(name: 'ProcessorAlgae') @Default(0) int processorAlgae,
    @JsonKey(name: 'EndgameStatuses') required List<int> endgameStatuses,
    @JsonKey(name: 'Fouls') @Default([]) List<CheesyFoul> fouls,
    @JsonKey(name: 'PlayoffDq') @Default(false) bool playoffDq,
  }) = _CheesyGameScore;

  factory CheesyGameScore.fromJson(Map<String, dynamic> json) =>
      _$CheesyGameScoreFromJson(json);
}

/// 2025 REEFSCAPE reef — update each season.
@freezed
abstract class CheesyReef with _$CheesyReef {
  const factory CheesyReef({
    @JsonKey(name: 'AutoBranches') required List<List<bool>> autoBranches,
    @JsonKey(name: 'Branches') required List<List<bool>> branches,
    @JsonKey(name: 'AutoTroughNear') @Default(0) int autoTroughNear,
    @JsonKey(name: 'AutoTroughFar') @Default(0) int autoTroughFar,
    @JsonKey(name: 'TroughNear') @Default(0) int troughNear,
    @JsonKey(name: 'TroughFar') @Default(0) int troughFar,
  }) = _CheesyReef;

  factory CheesyReef.fromJson(Map<String, dynamic> json) =>
      _$CheesyReefFromJson(json);
}

@freezed
abstract class CheesyFoul with _$CheesyFoul {
  const factory CheesyFoul({
    @JsonKey(name: 'FoulId') required int foulId,
    @JsonKey(name: 'IsMajor') required bool isMajor,
    @JsonKey(name: 'TeamId') @Default(0) int teamId,
    @JsonKey(name: 'RuleId') @Default(0) int ruleId,
  }) = _CheesyFoul;

  factory CheesyFoul.fromJson(Map<String, dynamic> json) =>
      _$CheesyFoulFromJson(json);
}

/// Calculated score totals — relatively stable across seasons.
@freezed
abstract class CheesyScoreSummary with _$CheesyScoreSummary {
  const factory CheesyScoreSummary({
    @JsonKey(name: 'LeavePoints') @Default(0) int leavePoints,
    @JsonKey(name: 'AutoPoints') @Default(0) int autoPoints,
    @JsonKey(name: 'NumCoral') @Default(0) int numCoral,
    @JsonKey(name: 'CoralPoints') @Default(0) int coralPoints,
    @JsonKey(name: 'NumAlgae') @Default(0) int numAlgae,
    @JsonKey(name: 'AlgaePoints') @Default(0) int algaePoints,
    @JsonKey(name: 'BargePoints') @Default(0) int bargePoints,
    @JsonKey(name: 'MatchPoints') @Default(0) int matchPoints,
    @JsonKey(name: 'FoulPoints') @Default(0) int foulPoints,
    @JsonKey(name: 'Score') @Default(0) int score,
    @JsonKey(name: 'CoopertitionCriteriaMet') @Default(false) bool coopertitionCriteriaMet,
    @JsonKey(name: 'CoopertitionBonus') @Default(false) bool coopertitionBonus,
    @JsonKey(name: 'NumCoralLevels') @Default(0) int numCoralLevels,
    @JsonKey(name: 'NumCoralLevelsGoal') @Default(4) int numCoralLevelsGoal,
    @JsonKey(name: 'AutoBonusRankingPoint') @Default(false) bool autoBonusRankingPoint,
    @JsonKey(name: 'CoralBonusRankingPoint') @Default(false) bool coralBonusRankingPoint,
    @JsonKey(name: 'BargeBonusRankingPoint') @Default(false) bool bargeBonusRankingPoint,
    @JsonKey(name: 'BonusRankingPoints') @Default(0) int bonusRankingPoints,
    @JsonKey(name: 'NumOpponentMajorFouls') @Default(0) int numOpponentMajorFouls,
  }) = _CheesyScoreSummary;

  factory CheesyScoreSummary.fromJson(Map<String, dynamic> json) =>
      _$CheesyScoreSummaryFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// SCORING STATUS
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyScoringStatus with _$CheesyScoringStatus {
  const factory CheesyScoringStatus({
    @JsonKey(name: 'RefereeScoreReady') @Default(false) bool refereeScoreReady,
    @JsonKey(name: 'PositionStatuses')
    required Map<String, CheesyPositionStatus> positionStatuses,
  }) = _CheesyScoringStatus;

  factory CheesyScoringStatus.fromJson(Map<String, dynamic> json) =>
      _$CheesyScoringStatusFromJson(json);
}

@freezed
abstract class CheesyPositionStatus with _$CheesyPositionStatus {
  const factory CheesyPositionStatus({
    @JsonKey(name: 'Ready') @Default(false) bool ready,
    @JsonKey(name: 'NumPanels') @Default(0) int numPanels,
    @JsonKey(name: 'NumPanelsReady') @Default(0) int numPanelsReady,
  }) = _CheesyPositionStatus;

  factory CheesyPositionStatus.fromJson(Map<String, dynamic> json) =>
      _$CheesyPositionStatusFromJson(json);
}

// ═══════════════════════════════════════════════════════════════════════════════
// SCORE POSTED
// ═══════════════════════════════════════════════════════════════════════════════

@freezed
abstract class CheesyScorePosted with _$CheesyScorePosted {
  const factory CheesyScorePosted({
    @JsonKey(name: 'Match') CheesyMatch? match,
    @JsonKey(name: 'RedScoreSummary') CheesyScoreSummary? redScoreSummary,
    @JsonKey(name: 'BlueScoreSummary') CheesyScoreSummary? blueScoreSummary,
    @JsonKey(name: 'RedRankingPoints') @Default(0) int redRankingPoints,
    @JsonKey(name: 'BlueRankingPoints') @Default(0) int blueRankingPoints,
    @JsonKey(name: 'RedFouls') @Default([]) List<CheesyFoul> redFouls,
    @JsonKey(name: 'BlueFouls') @Default([]) List<CheesyFoul> blueFouls,
    @JsonKey(name: 'RedCards') @Default({}) Map<String, String> redCards,
    @JsonKey(name: 'BlueCards') @Default({}) Map<String, String> blueCards,
    @JsonKey(name: 'RedRankings') @Default({}) Map<String, CheesyTeamRanking?> redRankings,
    @JsonKey(name: 'BlueRankings') @Default({}) Map<String, CheesyTeamRanking?> blueRankings,
    @JsonKey(name: 'RedOffFieldTeamIds') @Default([]) List<int> redOffFieldTeamIds,
    @JsonKey(name: 'BlueOffFieldTeamIds') @Default([]) List<int> blueOffFieldTeamIds,
    @JsonKey(name: 'RedWon') @Default(false) bool redWon,
    @JsonKey(name: 'BlueWon') @Default(false) bool blueWon,
    @JsonKey(name: 'RedWins') @Default(0) int redWins,
    @JsonKey(name: 'BlueWins') @Default(0) int blueWins,
    @JsonKey(name: 'RedDestination') @Default('') String redDestination,
    @JsonKey(name: 'BlueDestination') @Default('') String blueDestination,
    @JsonKey(name: 'CoopertitionEnabled') @Default(false) bool coopertitionEnabled,
  }) = _CheesyScorePosted;

  factory CheesyScorePosted.fromJson(Map<String, dynamic> json) =>
      _$CheesyScorePostedFromJson(json);
}

@freezed
abstract class CheesyTeamRanking with _$CheesyTeamRanking {
  const factory CheesyTeamRanking({
    @JsonKey(name: 'TeamId') required int teamId,
    @JsonKey(name: 'Rank') @Default(0) int rank,
    @JsonKey(name: 'PreviousRank') @Default(0) int previousRank,
    @JsonKey(name: 'RankingPoints') @Default(0) int rankingPoints,
    @JsonKey(name: 'CoopertitionPoints') @Default(0) int coopertitionPoints,
    @JsonKey(name: 'MatchPoints') @Default(0) int matchPoints,
    @JsonKey(name: 'AutoPoints') @Default(0) int autoPoints,
    @JsonKey(name: 'BargePoints') @Default(0) int bargePoints,
    @JsonKey(name: 'Wins') @Default(0) int wins,
    @JsonKey(name: 'Losses') @Default(0) int losses,
    @JsonKey(name: 'Ties') @Default(0) int ties,
    @JsonKey(name: 'Disqualifications') @Default(0) int disqualifications,
    @JsonKey(name: 'Played') @Default(0) int played,
  }) = _CheesyTeamRanking;

  factory CheesyTeamRanking.fromJson(Map<String, dynamic> json) =>
      _$CheesyTeamRankingFromJson(json);
}
