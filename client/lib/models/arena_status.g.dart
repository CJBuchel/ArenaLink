// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arena_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArenaMessage _$ArenaMessageFromJson(Map<String, dynamic> json) =>
    _ArenaMessage(type: json['type'] as String, data: json['data']);

Map<String, dynamic> _$ArenaMessageToJson(_ArenaMessage instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};

_ArenaStatus _$ArenaStatusFromJson(Map<String, dynamic> json) => _ArenaStatus(
  matchId: (json['MatchId'] as num).toInt(),
  allianceStations: (json['AllianceStations'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, AllianceStation.fromJson(e as Map<String, dynamic>)),
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

Map<String, dynamic> _$ArenaStatusToJson(_ArenaStatus instance) =>
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

_EventStatus _$EventStatusFromJson(Map<String, dynamic> json) => _EventStatus(
  cycleTime: json['CycleTime'] as String? ?? '',
  earlyLateMessage: json['EarlyLateMessage'] as String? ?? '',
);

Map<String, dynamic> _$EventStatusToJson(_EventStatus instance) =>
    <String, dynamic>{
      'CycleTime': instance.cycleTime,
      'EarlyLateMessage': instance.earlyLateMessage,
    };

_MatchTimeMessage _$MatchTimeMessageFromJson(Map<String, dynamic> json) =>
    _MatchTimeMessage(
      matchState: (json['MatchState'] as num).toInt(),
      matchTimeSec: (json['MatchTimeSec'] as num).toInt(),
    );

Map<String, dynamic> _$MatchTimeMessageToJson(_MatchTimeMessage instance) =>
    <String, dynamic>{
      'MatchState': instance.matchState,
      'MatchTimeSec': instance.matchTimeSec,
    };

_AllianceStation _$AllianceStationFromJson(Map<String, dynamic> json) =>
    _AllianceStation(
      dsConn: json['DsConn'] == null
          ? null
          : DriverStationConnection.fromJson(
              json['DsConn'] as Map<String, dynamic>,
            ),
      ethernet: json['Ethernet'] as bool,
      aStop: json['AStop'] as bool,
      eStop: json['EStop'] as bool,
      bypass: json['Bypass'] as bool,
      team: json['Team'] == null
          ? null
          : Team.fromJson(json['Team'] as Map<String, dynamic>),
      wifiStatus: WifiStatus.fromJson(
        json['WifiStatus'] as Map<String, dynamic>,
      ),
      gameData: json['GameData'] as String? ?? '',
    );

Map<String, dynamic> _$AllianceStationToJson(_AllianceStation instance) =>
    <String, dynamic>{
      'DsConn': instance.dsConn,
      'Ethernet': instance.ethernet,
      'AStop': instance.aStop,
      'EStop': instance.eStop,
      'Bypass': instance.bypass,
      'Team': instance.team,
      'WifiStatus': instance.wifiStatus,
      'GameData': instance.gameData,
    };

_WifiStatus _$WifiStatusFromJson(Map<String, dynamic> json) => _WifiStatus(
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

Map<String, dynamic> _$WifiStatusToJson(_WifiStatus instance) =>
    <String, dynamic>{
      'TeamId': instance.teamId,
      'RadioLinked': instance.radioLinked,
      'MBits': instance.mBits,
      'RxRate': instance.rxRate,
      'TxRate': instance.txRate,
      'SignalNoiseRatio': instance.signalNoiseRatio,
      'ConnectionQuality': instance.connectionQuality,
    };

_DriverStationConnection _$DriverStationConnectionFromJson(
  Map<String, dynamic> json,
) => _DriverStationConnection(
  dsLinked: json['DsLinked'] as bool,
  rioLinked: json['RioLinked'] as bool? ?? false,
  robotLinked: json['RobotLinked'] as bool,
  radioLinked: json['RadioLinked'] as bool,
  batteryVoltage: _numToDouble(json['BatteryVoltage']),
  dsRobotTripTimeMs: (json['DsRobotTripTimeMs'] as num).toInt(),
  missedPacketCount: (json['MissedPacketCount'] as num).toInt(),
);

Map<String, dynamic> _$DriverStationConnectionToJson(
  _DriverStationConnection instance,
) => <String, dynamic>{
  'DsLinked': instance.dsLinked,
  'RioLinked': instance.rioLinked,
  'RobotLinked': instance.robotLinked,
  'RadioLinked': instance.radioLinked,
  'BatteryVoltage': instance.batteryVoltage,
  'DsRobotTripTimeMs': instance.dsRobotTripTimeMs,
  'MissedPacketCount': instance.missedPacketCount,
};

_Team _$TeamFromJson(Map<String, dynamic> json) => _Team(
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

Map<String, dynamic> _$TeamToJson(_Team instance) => <String, dynamic>{
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
