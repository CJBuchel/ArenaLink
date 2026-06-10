import 'package:freezed_annotation/freezed_annotation.dart';

part 'arena_status.freezed.dart';
part 'arena_status.g.dart';

@freezed
abstract class ArenaMessage with _$ArenaMessage {
  const factory ArenaMessage({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'data') required dynamic data,
  }) = _ArenaMessage;

  factory ArenaMessage.fromJson(Map<String, dynamic> json) =>
      _$ArenaMessageFromJson(json);
}

@freezed
abstract class ArenaStatus with _$ArenaStatus {
  const factory ArenaStatus({
    @JsonKey(name: 'MatchId') required int matchId,
    @JsonKey(name: 'AllianceStations')
    required Map<String, AllianceStation> allianceStations,
    @JsonKey(name: 'MatchState') required int matchState,
    @JsonKey(name: 'CanStartMatch') required bool canStartMatch,
    @JsonKey(name: 'PlcIsHealthy') required bool plcIsHealthy,
    @JsonKey(name: 'FieldEStop') required bool fieldEStop,
  }) = _ArenaStatus;

  factory ArenaStatus.fromJson(Map<String, dynamic> json) =>
      _$ArenaStatusFromJson(json);
}

@freezed
abstract class AllianceStation with _$AllianceStation {
  const factory AllianceStation({
    @JsonKey(name: 'DsConn') DriverStationConnection? dsConn,
    @JsonKey(name: 'Ethernet') required bool ethernet,
    @JsonKey(name: 'AStop') required bool aStop,
    @JsonKey(name: 'EStop') required bool eStop,
    @JsonKey(name: 'Bypass') required bool bypass,
    @JsonKey(name: 'Team') Team? team,
  }) = _AllianceStation;

  factory AllianceStation.fromJson(Map<String, dynamic> json) =>
      _$AllianceStationFromJson(json);
}

@freezed
abstract class DriverStationConnection with _$DriverStationConnection {
  const factory DriverStationConnection({
    @JsonKey(name: 'DsLinked') required bool dsLinked,
    @JsonKey(name: 'RobotLinked') required bool robotLinked,
    @JsonKey(name: 'RadioLinked') required bool radioLinked,
    @JsonKey(name: 'BatteryVoltage') required double batteryVoltage,
    @JsonKey(name: 'DsRobotTripTimeMs') required int dsRobotTripTimeMs,
    @JsonKey(name: 'MissedPacketCount') required int missedPacketCount,
  }) = _DriverStationConnection;

  factory DriverStationConnection.fromJson(Map<String, dynamic> json) =>
      _$DriverStationConnectionFromJson(json);
}

@freezed
abstract class Team with _$Team {
  const factory Team({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Name') required String name,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
