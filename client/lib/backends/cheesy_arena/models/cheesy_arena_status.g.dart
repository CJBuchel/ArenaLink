// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheesy_arena_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArenaMessage _$ArenaMessageFromJson(Map<String, dynamic> json) =>
    _ArenaMessage(type: json['type'] as String, data: json['data']);

Map<String, dynamic> _$ArenaMessageToJson(_ArenaMessage instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};

_CheesyArenaStatus _$CheesyArenaStatusFromJson(Map<String, dynamic> json) =>
    _CheesyArenaStatus(
      matchId: (json['MatchId'] as num).toInt(),
      allianceStations: (json['AllianceStations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          CheesyAllianceStation.fromJson(e as Map<String, dynamic>),
        ),
      ),
      matchState: (json['MatchState'] as num).toInt(),
      canStartMatch: json['CanStartMatch'] as bool,
      plcIsHealthy: json['PlcIsHealthy'] as bool,
      fieldEStop: json['FieldEStop'] as bool,
      accessPointStatus: json['AccessPointStatus'] as String? ?? 'UNKNOWN',
      switchStatus: json['SwitchStatus'] as String? ?? 'UNKNOWN',
      redSccStatus: json['RedSCCStatus'] as String? ?? 'UNKNOWN',
      blueSccStatus: json['BlueSCCStatus'] as String? ?? 'UNKNOWN',
      plcArmorBlockStatuses:
          (json['PlcArmorBlockStatuses'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ),
    );

Map<String, dynamic> _$CheesyArenaStatusToJson(_CheesyArenaStatus instance) =>
    <String, dynamic>{
      'MatchId': instance.matchId,
      'AllianceStations': instance.allianceStations,
      'MatchState': instance.matchState,
      'CanStartMatch': instance.canStartMatch,
      'PlcIsHealthy': instance.plcIsHealthy,
      'FieldEStop': instance.fieldEStop,
      'AccessPointStatus': instance.accessPointStatus,
      'SwitchStatus': instance.switchStatus,
      'RedSCCStatus': instance.redSccStatus,
      'BlueSCCStatus': instance.blueSccStatus,
      'PlcArmorBlockStatuses': instance.plcArmorBlockStatuses,
    };

_CheesyEventStatus _$CheesyEventStatusFromJson(Map<String, dynamic> json) =>
    _CheesyEventStatus(
      cycleTime: json['CycleTime'] as String? ?? '',
      earlyLateMessage: json['EarlyLateMessage'] as String? ?? '',
    );

Map<String, dynamic> _$CheesyEventStatusToJson(_CheesyEventStatus instance) =>
    <String, dynamic>{
      'CycleTime': instance.cycleTime,
      'EarlyLateMessage': instance.earlyLateMessage,
    };

_CheesyMatchTimeMessage _$CheesyMatchTimeMessageFromJson(
  Map<String, dynamic> json,
) => _CheesyMatchTimeMessage(
  matchState: (json['MatchState'] as num).toInt(),
  matchTimeSec: (json['MatchTimeSec'] as num).toInt(),
);

Map<String, dynamic> _$CheesyMatchTimeMessageToJson(
  _CheesyMatchTimeMessage instance,
) => <String, dynamic>{
  'MatchState': instance.matchState,
  'MatchTimeSec': instance.matchTimeSec,
};

_CheesyMatchTiming _$CheesyMatchTimingFromJson(Map<String, dynamic> json) =>
    _CheesyMatchTiming(
      autoDurationSec: (json['AutoDurationSec'] as num?)?.toInt() ?? 15,
      pauseDurationSec: (json['PauseDurationSec'] as num?)?.toInt() ?? 3,
      transitionShiftDurationSec:
          (json['TransitionShiftDurationSec'] as num?)?.toInt() ?? 10,
      shiftDurationSec: (json['ShiftDurationSec'] as num?)?.toInt() ?? 25,
      endgameDurationSec: (json['EndgameDurationSec'] as num?)?.toInt() ?? 30,
      warningRemainingDurationSec:
          (json['WarningRemainingDurationSec'] as num?)?.toInt() ?? 20,
      timeoutDurationSec: (json['TimeoutDurationSec'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CheesyMatchTimingToJson(_CheesyMatchTiming instance) =>
    <String, dynamic>{
      'AutoDurationSec': instance.autoDurationSec,
      'PauseDurationSec': instance.pauseDurationSec,
      'TransitionShiftDurationSec': instance.transitionShiftDurationSec,
      'ShiftDurationSec': instance.shiftDurationSec,
      'EndgameDurationSec': instance.endgameDurationSec,
      'WarningRemainingDurationSec': instance.warningRemainingDurationSec,
      'TimeoutDurationSec': instance.timeoutDurationSec,
    };

_CheesyMatchLoad _$CheesyMatchLoadFromJson(Map<String, dynamic> json) =>
    _CheesyMatchLoad(
      match: CheesyMatch.fromJson(json['Match'] as Map<String, dynamic>),
      allowSubstitution: json['AllowSubstitution'] as bool? ?? false,
      isReplay: json['IsReplay'] as bool? ?? false,
      teams: (json['Teams'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          e == null ? null : CheesyTeam.fromJson(e as Map<String, dynamic>),
        ),
      ),
      rankings:
          (json['Rankings'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      breakDescription: json['BreakDescription'] as String? ?? '',
      matchup: json['Matchup'],
    );

Map<String, dynamic> _$CheesyMatchLoadToJson(_CheesyMatchLoad instance) =>
    <String, dynamic>{
      'Match': instance.match,
      'AllowSubstitution': instance.allowSubstitution,
      'IsReplay': instance.isReplay,
      'Teams': instance.teams,
      'Rankings': instance.rankings,
      'BreakDescription': instance.breakDescription,
      'Matchup': instance.matchup,
    };

_CheesyMatch _$CheesyMatchFromJson(Map<String, dynamic> json) => _CheesyMatch(
  id: (json['Id'] as num).toInt(),
  type: (json['Type'] as num).toInt(),
  typeOrder: (json['TypeOrder'] as num?)?.toInt() ?? 0,
  longName: json['LongName'] as String? ?? '',
  shortName: json['ShortName'] as String? ?? '',
  nameDetail: json['NameDetail'] as String? ?? '',
  playoffMatchGroupId: json['PlayoffMatchGroupId'] as String? ?? '',
  playoffRedAlliance: (json['PlayoffRedAlliance'] as num?)?.toInt() ?? 0,
  playoffBlueAlliance: (json['PlayoffBlueAlliance'] as num?)?.toInt() ?? 0,
  red1: (json['Red1'] as num?)?.toInt() ?? 0,
  red1IsSurrogate: json['Red1IsSurrogate'] as bool? ?? false,
  red2: (json['Red2'] as num?)?.toInt() ?? 0,
  red2IsSurrogate: json['Red2IsSurrogate'] as bool? ?? false,
  red3: (json['Red3'] as num?)?.toInt() ?? 0,
  red3IsSurrogate: json['Red3IsSurrogate'] as bool? ?? false,
  blue1: (json['Blue1'] as num?)?.toInt() ?? 0,
  blue1IsSurrogate: json['Blue1IsSurrogate'] as bool? ?? false,
  blue2: (json['Blue2'] as num?)?.toInt() ?? 0,
  blue2IsSurrogate: json['Blue2IsSurrogate'] as bool? ?? false,
  blue3: (json['Blue3'] as num?)?.toInt() ?? 0,
  blue3IsSurrogate: json['Blue3IsSurrogate'] as bool? ?? false,
  status: (json['Status'] as num?)?.toInt() ?? 0,
  scheduledStartTime: json['ScheduledStartTime'] == null
      ? null
      : DateTime.parse(json['ScheduledStartTime'] as String),
);

Map<String, dynamic> _$CheesyMatchToJson(_CheesyMatch instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Type': instance.type,
      'TypeOrder': instance.typeOrder,
      'LongName': instance.longName,
      'ShortName': instance.shortName,
      'NameDetail': instance.nameDetail,
      'PlayoffMatchGroupId': instance.playoffMatchGroupId,
      'PlayoffRedAlliance': instance.playoffRedAlliance,
      'PlayoffBlueAlliance': instance.playoffBlueAlliance,
      'Red1': instance.red1,
      'Red1IsSurrogate': instance.red1IsSurrogate,
      'Red2': instance.red2,
      'Red2IsSurrogate': instance.red2IsSurrogate,
      'Red3': instance.red3,
      'Red3IsSurrogate': instance.red3IsSurrogate,
      'Blue1': instance.blue1,
      'Blue1IsSurrogate': instance.blue1IsSurrogate,
      'Blue2': instance.blue2,
      'Blue2IsSurrogate': instance.blue2IsSurrogate,
      'Blue3': instance.blue3,
      'Blue3IsSurrogate': instance.blue3IsSurrogate,
      'Status': instance.status,
      'ScheduledStartTime': instance.scheduledStartTime?.toIso8601String(),
    };

_CheesyAllianceStation _$CheesyAllianceStationFromJson(
  Map<String, dynamic> json,
) => _CheesyAllianceStation(
  dsConn: json['DsConn'] == null
      ? null
      : CheesyDsConnection.fromJson(json['DsConn'] as Map<String, dynamic>),
  ethernet: json['Ethernet'] as bool,
  aStop: json['AStop'] as bool,
  eStop: json['EStop'] as bool,
  bypass: json['Bypass'] as bool,
  team: json['Team'] == null
      ? null
      : CheesyTeam.fromJson(json['Team'] as Map<String, dynamic>),
  wifiStatus: CheesyWifiStatus.fromJson(
    json['WifiStatus'] as Map<String, dynamic>,
  ),
  gameData: json['GameData'] as String? ?? '',
);

Map<String, dynamic> _$CheesyAllianceStationToJson(
  _CheesyAllianceStation instance,
) => <String, dynamic>{
  'DsConn': instance.dsConn,
  'Ethernet': instance.ethernet,
  'AStop': instance.aStop,
  'EStop': instance.eStop,
  'Bypass': instance.bypass,
  'Team': instance.team,
  'WifiStatus': instance.wifiStatus,
  'GameData': instance.gameData,
};

_CheesyWifiStatus _$CheesyWifiStatusFromJson(Map<String, dynamic> json) =>
    _CheesyWifiStatus(
      teamId: (json['TeamId'] as num).toInt(),
      radioLinked: json['RadioLinked'] as bool,
      mBits: json['MBits'] == null ? 0.0 : _numToDouble(json['MBits']),
      rxRate: json['RxRate'] == null ? 0.0 : _numToDouble(json['RxRate']),
      txRate: json['TxRate'] == null ? 0.0 : _numToDouble(json['TxRate']),
      signalNoiseRatio: json['SignalNoiseRatio'] == null
          ? 0.0
          : _numToDouble(json['SignalNoiseRatio']),
      connectionQuality: (json['ConnectionQuality'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CheesyWifiStatusToJson(_CheesyWifiStatus instance) =>
    <String, dynamic>{
      'TeamId': instance.teamId,
      'RadioLinked': instance.radioLinked,
      'MBits': instance.mBits,
      'RxRate': instance.rxRate,
      'TxRate': instance.txRate,
      'SignalNoiseRatio': instance.signalNoiseRatio,
      'ConnectionQuality': instance.connectionQuality,
    };

_CheesyDsConnection _$CheesyDsConnectionFromJson(Map<String, dynamic> json) =>
    _CheesyDsConnection(
      dsLinked: json['DsLinked'] as bool,
      rioLinked: json['RioLinked'] as bool? ?? false,
      robotLinked: json['RobotLinked'] as bool,
      radioLinked: json['RadioLinked'] as bool,
      batteryVoltage: _numToDouble(json['BatteryVoltage']),
      dsRobotTripTimeMs: (json['DsRobotTripTimeMs'] as num).toInt(),
      missedPacketCount: (json['MissedPacketCount'] as num).toInt(),
    );

Map<String, dynamic> _$CheesyDsConnectionToJson(_CheesyDsConnection instance) =>
    <String, dynamic>{
      'DsLinked': instance.dsLinked,
      'RioLinked': instance.rioLinked,
      'RobotLinked': instance.robotLinked,
      'RadioLinked': instance.radioLinked,
      'BatteryVoltage': instance.batteryVoltage,
      'DsRobotTripTimeMs': instance.dsRobotTripTimeMs,
      'MissedPacketCount': instance.missedPacketCount,
    };

_CheesyTeam _$CheesyTeamFromJson(Map<String, dynamic> json) => _CheesyTeam(
  id: (json['Id'] as num).toInt(),
  name: json['Name'] as String,
  nickname: json['Nickname'] as String? ?? '',
  city: json['City'] as String? ?? '',
  stateProv: json['StateProv'] as String? ?? '',
  country: json['Country'] as String? ?? '',
  schoolName: json['SchoolName'] as String? ?? '',
  rookieYear: (json['RookieYear'] as num?)?.toInt() ?? 0,
  robotName: json['RobotName'] as String? ?? '',
  yellowCard: json['YellowCard'] as bool? ?? false,
  hasConnected: json['HasConnected'] as bool? ?? false,
  ftaNotes: json['FtaNotes'] as String? ?? '',
);

Map<String, dynamic> _$CheesyTeamToJson(_CheesyTeam instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Nickname': instance.nickname,
      'City': instance.city,
      'StateProv': instance.stateProv,
      'Country': instance.country,
      'SchoolName': instance.schoolName,
      'RookieYear': instance.rookieYear,
      'RobotName': instance.robotName,
      'YellowCard': instance.yellowCard,
      'HasConnected': instance.hasConnected,
      'FtaNotes': instance.ftaNotes,
    };

_CheesyRealtimeScore _$CheesyRealtimeScoreFromJson(Map<String, dynamic> json) =>
    _CheesyRealtimeScore(
      red: CheesyAllianceScore.fromJson(json['Red'] as Map<String, dynamic>),
      blue: CheesyAllianceScore.fromJson(json['Blue'] as Map<String, dynamic>),
      redCards:
          (json['RedCards'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      blueCards:
          (json['BlueCards'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      matchState: (json['MatchState'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CheesyRealtimeScoreToJson(
  _CheesyRealtimeScore instance,
) => <String, dynamic>{
  'Red': instance.red,
  'Blue': instance.blue,
  'RedCards': instance.redCards,
  'BlueCards': instance.blueCards,
  'MatchState': instance.matchState,
};

_CheesyAllianceScore _$CheesyAllianceScoreFromJson(Map<String, dynamic> json) =>
    _CheesyAllianceScore(
      score: json['Score'] as Map<String, dynamic>? ?? const {},
      scoreSummary: CheesyScoreSummary.fromJson(
        json['ScoreSummary'] as Map<String, dynamic>,
      ),
      activeRemainingSec: (json['ActiveRemainingSec'] as num?)?.toInt() ?? 0,
      activeDurationSec: (json['ActiveDurationSec'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CheesyAllianceScoreToJson(
  _CheesyAllianceScore instance,
) => <String, dynamic>{
  'Score': instance.score,
  'ScoreSummary': instance.scoreSummary,
  'ActiveRemainingSec': instance.activeRemainingSec,
  'ActiveDurationSec': instance.activeDurationSec,
};

_CheesyGameScore _$CheesyGameScoreFromJson(Map<String, dynamic> json) =>
    _CheesyGameScore(
      robotsBypassed: (json['RobotsBypassed'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      leaveStatuses: (json['LeaveStatuses'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      reef: CheesyReef.fromJson(json['Reef'] as Map<String, dynamic>),
      bargeAlgae: (json['BargeAlgae'] as num?)?.toInt() ?? 0,
      processorAlgae: (json['ProcessorAlgae'] as num?)?.toInt() ?? 0,
      endgameStatuses: (json['EndgameStatuses'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      fouls:
          (json['Fouls'] as List<dynamic>?)
              ?.map((e) => CheesyFoul.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playoffDq: json['PlayoffDq'] as bool? ?? false,
    );

Map<String, dynamic> _$CheesyGameScoreToJson(_CheesyGameScore instance) =>
    <String, dynamic>{
      'RobotsBypassed': instance.robotsBypassed,
      'LeaveStatuses': instance.leaveStatuses,
      'Reef': instance.reef,
      'BargeAlgae': instance.bargeAlgae,
      'ProcessorAlgae': instance.processorAlgae,
      'EndgameStatuses': instance.endgameStatuses,
      'Fouls': instance.fouls,
      'PlayoffDq': instance.playoffDq,
    };

_CheesyReef _$CheesyReefFromJson(Map<String, dynamic> json) => _CheesyReef(
  autoBranches: (json['AutoBranches'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
      .toList(),
  branches: (json['Branches'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
      .toList(),
  autoTroughNear: (json['AutoTroughNear'] as num?)?.toInt() ?? 0,
  autoTroughFar: (json['AutoTroughFar'] as num?)?.toInt() ?? 0,
  troughNear: (json['TroughNear'] as num?)?.toInt() ?? 0,
  troughFar: (json['TroughFar'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CheesyReefToJson(_CheesyReef instance) =>
    <String, dynamic>{
      'AutoBranches': instance.autoBranches,
      'Branches': instance.branches,
      'AutoTroughNear': instance.autoTroughNear,
      'AutoTroughFar': instance.autoTroughFar,
      'TroughNear': instance.troughNear,
      'TroughFar': instance.troughFar,
    };

_CheesyFoul _$CheesyFoulFromJson(Map<String, dynamic> json) => _CheesyFoul(
  foulId: (json['FoulId'] as num).toInt(),
  isMajor: json['IsMajor'] as bool,
  teamId: (json['TeamId'] as num?)?.toInt() ?? 0,
  ruleId: (json['RuleId'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CheesyFoulToJson(_CheesyFoul instance) =>
    <String, dynamic>{
      'FoulId': instance.foulId,
      'IsMajor': instance.isMajor,
      'TeamId': instance.teamId,
      'RuleId': instance.ruleId,
    };

_CheesyScoreSummary _$CheesyScoreSummaryFromJson(
  Map<String, dynamic> json,
) => _CheesyScoreSummary(
  leavePoints: (json['LeavePoints'] as num?)?.toInt() ?? 0,
  autoPoints: (json['AutoPoints'] as num?)?.toInt() ?? 0,
  numCoral: (json['NumCoral'] as num?)?.toInt() ?? 0,
  coralPoints: (json['CoralPoints'] as num?)?.toInt() ?? 0,
  numAlgae: (json['NumAlgae'] as num?)?.toInt() ?? 0,
  algaePoints: (json['AlgaePoints'] as num?)?.toInt() ?? 0,
  bargePoints: (json['BargePoints'] as num?)?.toInt() ?? 0,
  matchPoints: (json['MatchPoints'] as num?)?.toInt() ?? 0,
  foulPoints: (json['FoulPoints'] as num?)?.toInt() ?? 0,
  score: (json['Score'] as num?)?.toInt() ?? 0,
  coopertitionCriteriaMet: json['CoopertitionCriteriaMet'] as bool? ?? false,
  coopertitionBonus: json['CoopertitionBonus'] as bool? ?? false,
  numCoralLevels: (json['NumCoralLevels'] as num?)?.toInt() ?? 0,
  numCoralLevelsGoal: (json['NumCoralLevelsGoal'] as num?)?.toInt() ?? 4,
  autoBonusRankingPoint: json['AutoBonusRankingPoint'] as bool? ?? false,
  coralBonusRankingPoint: json['CoralBonusRankingPoint'] as bool? ?? false,
  bargeBonusRankingPoint: json['BargeBonusRankingPoint'] as bool? ?? false,
  bonusRankingPoints: (json['BonusRankingPoints'] as num?)?.toInt() ?? 0,
  numOpponentMajorFouls: (json['NumOpponentMajorFouls'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CheesyScoreSummaryToJson(_CheesyScoreSummary instance) =>
    <String, dynamic>{
      'LeavePoints': instance.leavePoints,
      'AutoPoints': instance.autoPoints,
      'NumCoral': instance.numCoral,
      'CoralPoints': instance.coralPoints,
      'NumAlgae': instance.numAlgae,
      'AlgaePoints': instance.algaePoints,
      'BargePoints': instance.bargePoints,
      'MatchPoints': instance.matchPoints,
      'FoulPoints': instance.foulPoints,
      'Score': instance.score,
      'CoopertitionCriteriaMet': instance.coopertitionCriteriaMet,
      'CoopertitionBonus': instance.coopertitionBonus,
      'NumCoralLevels': instance.numCoralLevels,
      'NumCoralLevelsGoal': instance.numCoralLevelsGoal,
      'AutoBonusRankingPoint': instance.autoBonusRankingPoint,
      'CoralBonusRankingPoint': instance.coralBonusRankingPoint,
      'BargeBonusRankingPoint': instance.bargeBonusRankingPoint,
      'BonusRankingPoints': instance.bonusRankingPoints,
      'NumOpponentMajorFouls': instance.numOpponentMajorFouls,
    };

_CheesyScoringStatus _$CheesyScoringStatusFromJson(Map<String, dynamic> json) =>
    _CheesyScoringStatus(
      refereeScoreReady: json['RefereeScoreReady'] as bool? ?? false,
      positionStatuses: (json['PositionStatuses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          CheesyPositionStatus.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );

Map<String, dynamic> _$CheesyScoringStatusToJson(
  _CheesyScoringStatus instance,
) => <String, dynamic>{
  'RefereeScoreReady': instance.refereeScoreReady,
  'PositionStatuses': instance.positionStatuses,
};

_CheesyPositionStatus _$CheesyPositionStatusFromJson(
  Map<String, dynamic> json,
) => _CheesyPositionStatus(
  ready: json['Ready'] as bool? ?? false,
  numPanels: (json['NumPanels'] as num?)?.toInt() ?? 0,
  numPanelsReady: (json['NumPanelsReady'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CheesyPositionStatusToJson(
  _CheesyPositionStatus instance,
) => <String, dynamic>{
  'Ready': instance.ready,
  'NumPanels': instance.numPanels,
  'NumPanelsReady': instance.numPanelsReady,
};

_CheesyScorePosted _$CheesyScorePostedFromJson(Map<String, dynamic> json) =>
    _CheesyScorePosted(
      match: json['Match'] == null
          ? null
          : CheesyMatch.fromJson(json['Match'] as Map<String, dynamic>),
      redScoreSummary: json['RedScoreSummary'] == null
          ? null
          : CheesyScoreSummary.fromJson(
              json['RedScoreSummary'] as Map<String, dynamic>,
            ),
      blueScoreSummary: json['BlueScoreSummary'] == null
          ? null
          : CheesyScoreSummary.fromJson(
              json['BlueScoreSummary'] as Map<String, dynamic>,
            ),
      redRankingPoints: (json['RedRankingPoints'] as num?)?.toInt() ?? 0,
      blueRankingPoints: (json['BlueRankingPoints'] as num?)?.toInt() ?? 0,
      redFouls:
          (json['RedFouls'] as List<dynamic>?)
              ?.map((e) => CheesyFoul.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      blueFouls:
          (json['BlueFouls'] as List<dynamic>?)
              ?.map((e) => CheesyFoul.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      redCards:
          (json['RedCards'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      blueCards:
          (json['BlueCards'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      redRankings:
          (json['RedRankings'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              e == null
                  ? null
                  : CheesyTeamRanking.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
      blueRankings:
          (json['BlueRankings'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              e == null
                  ? null
                  : CheesyTeamRanking.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
      redOffFieldTeamIds:
          (json['RedOffFieldTeamIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      blueOffFieldTeamIds:
          (json['BlueOffFieldTeamIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      redWon: json['RedWon'] as bool? ?? false,
      blueWon: json['BlueWon'] as bool? ?? false,
      redWins: (json['RedWins'] as num?)?.toInt() ?? 0,
      blueWins: (json['BlueWins'] as num?)?.toInt() ?? 0,
      redDestination: json['RedDestination'] as String? ?? '',
      blueDestination: json['BlueDestination'] as String? ?? '',
      coopertitionEnabled: json['CoopertitionEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$CheesyScorePostedToJson(_CheesyScorePosted instance) =>
    <String, dynamic>{
      'Match': instance.match,
      'RedScoreSummary': instance.redScoreSummary,
      'BlueScoreSummary': instance.blueScoreSummary,
      'RedRankingPoints': instance.redRankingPoints,
      'BlueRankingPoints': instance.blueRankingPoints,
      'RedFouls': instance.redFouls,
      'BlueFouls': instance.blueFouls,
      'RedCards': instance.redCards,
      'BlueCards': instance.blueCards,
      'RedRankings': instance.redRankings,
      'BlueRankings': instance.blueRankings,
      'RedOffFieldTeamIds': instance.redOffFieldTeamIds,
      'BlueOffFieldTeamIds': instance.blueOffFieldTeamIds,
      'RedWon': instance.redWon,
      'BlueWon': instance.blueWon,
      'RedWins': instance.redWins,
      'BlueWins': instance.blueWins,
      'RedDestination': instance.redDestination,
      'BlueDestination': instance.blueDestination,
      'CoopertitionEnabled': instance.coopertitionEnabled,
    };

_CheesyTeamRanking _$CheesyTeamRankingFromJson(Map<String, dynamic> json) =>
    _CheesyTeamRanking(
      teamId: (json['TeamId'] as num).toInt(),
      rank: (json['Rank'] as num?)?.toInt() ?? 0,
      previousRank: (json['PreviousRank'] as num?)?.toInt() ?? 0,
      rankingPoints: (json['RankingPoints'] as num?)?.toInt() ?? 0,
      coopertitionPoints: (json['CoopertitionPoints'] as num?)?.toInt() ?? 0,
      matchPoints: (json['MatchPoints'] as num?)?.toInt() ?? 0,
      autoPoints: (json['AutoPoints'] as num?)?.toInt() ?? 0,
      bargePoints: (json['BargePoints'] as num?)?.toInt() ?? 0,
      wins: (json['Wins'] as num?)?.toInt() ?? 0,
      losses: (json['Losses'] as num?)?.toInt() ?? 0,
      ties: (json['Ties'] as num?)?.toInt() ?? 0,
      disqualifications: (json['Disqualifications'] as num?)?.toInt() ?? 0,
      played: (json['Played'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CheesyTeamRankingToJson(_CheesyTeamRanking instance) =>
    <String, dynamic>{
      'TeamId': instance.teamId,
      'Rank': instance.rank,
      'PreviousRank': instance.previousRank,
      'RankingPoints': instance.rankingPoints,
      'CoopertitionPoints': instance.coopertitionPoints,
      'MatchPoints': instance.matchPoints,
      'AutoPoints': instance.autoPoints,
      'BargePoints': instance.bargePoints,
      'Wins': instance.wins,
      'Losses': instance.losses,
      'Ties': instance.ties,
      'Disqualifications': instance.disqualifications,
      'Played': instance.played,
    };
