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
);

Map<String, dynamic> _$ArenaStatusToJson(_ArenaStatus instance) =>
    <String, dynamic>{
      'MatchId': instance.matchId,
      'AllianceStations': instance.allianceStations,
      'MatchState': instance.matchState,
      'CanStartMatch': instance.canStartMatch,
      'PlcIsHealthy': instance.plcIsHealthy,
      'FieldEStop': instance.fieldEStop,
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
    );

Map<String, dynamic> _$AllianceStationToJson(_AllianceStation instance) =>
    <String, dynamic>{
      'DsConn': instance.dsConn,
      'Ethernet': instance.ethernet,
      'AStop': instance.aStop,
      'EStop': instance.eStop,
      'Bypass': instance.bypass,
      'Team': instance.team,
    };

_DriverStationConnection _$DriverStationConnectionFromJson(
  Map<String, dynamic> json,
) => _DriverStationConnection(
  dsLinked: json['DsLinked'] as bool,
  robotLinked: json['RobotLinked'] as bool,
  radioLinked: json['RadioLinked'] as bool,
  batteryVoltage: (json['BatteryVoltage'] as num).toDouble(),
  dsRobotTripTimeMs: (json['DsRobotTripTimeMs'] as num).toInt(),
  missedPacketCount: (json['MissedPacketCount'] as num).toInt(),
);

Map<String, dynamic> _$DriverStationConnectionToJson(
  _DriverStationConnection instance,
) => <String, dynamic>{
  'DsLinked': instance.dsLinked,
  'RobotLinked': instance.robotLinked,
  'RadioLinked': instance.radioLinked,
  'BatteryVoltage': instance.batteryVoltage,
  'DsRobotTripTimeMs': instance.dsRobotTripTimeMs,
  'MissedPacketCount': instance.missedPacketCount,
};

_Team _$TeamFromJson(Map<String, dynamic> json) =>
    _Team(id: (json['Id'] as num).toInt(), name: json['Name'] as String);

Map<String, dynamic> _$TeamToJson(_Team instance) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
};
