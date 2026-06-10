import 'package:freezed_annotation/freezed_annotation.dart';

part 'arena_status.freezed.dart';
part 'arena_status.g.dart';

double _numToDouble(dynamic v) => (v as num).toDouble();

// ─── Envelope ────────────────────────────────────────────────────────────────

@freezed
abstract class ArenaMessage with _$ArenaMessage {
  const factory ArenaMessage({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'data') required dynamic data,
  }) = _ArenaMessage;

  factory ArenaMessage.fromJson(Map<String, dynamic> json) =>
      _$ArenaMessageFromJson(json);
}

// ─── Arena Status ─────────────────────────────────────────────────────────────

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
    @JsonKey(name: 'AccessPointStatus') @Default('UNKNOWN') String accessPointStatus,
    @JsonKey(name: 'SwitchStatus') @Default('UNKNOWN') String switchStatus,
    @JsonKey(name: 'RedSCCStatus') @Default('UNKNOWN') String redSccStatus,
    @JsonKey(name: 'BlueSCCStatus') @Default('UNKNOWN') String blueSccStatus,
    // Generic map — keys are year-specific (e.g. "BlueDs", "RedIoLink") but the
    // map structure itself is stable across years.
    @JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses,
  }) = _ArenaStatus;

  factory ArenaStatus.fromJson(Map<String, dynamic> json) =>
      _$ArenaStatusFromJson(json);
}

// ─── Event Status ─────────────────────────────────────────────────────────────

@freezed
abstract class EventStatus with _$EventStatus {
  const factory EventStatus({
    @JsonKey(name: 'CycleTime') @Default('') String cycleTime,
    @JsonKey(name: 'EarlyLateMessage') @Default('') String earlyLateMessage,
  }) = _EventStatus;

  factory EventStatus.fromJson(Map<String, dynamic> json) =>
      _$EventStatusFromJson(json);
}

// ─── Match Time ───────────────────────────────────────────────────────────────

@freezed
abstract class MatchTimeMessage with _$MatchTimeMessage {
  const factory MatchTimeMessage({
    @JsonKey(name: 'MatchState') required int matchState,
    @JsonKey(name: 'MatchTimeSec') required int matchTimeSec,
  }) = _MatchTimeMessage;

  factory MatchTimeMessage.fromJson(Map<String, dynamic> json) =>
      _$MatchTimeMessageFromJson(json);
}

// ─── Alliance Station ────────────────────────────────────────────────────────

@freezed
abstract class AllianceStation with _$AllianceStation {
  const factory AllianceStation({
    @JsonKey(name: 'DsConn') DriverStationConnection? dsConn,
    @JsonKey(name: 'Ethernet') required bool ethernet,
    @JsonKey(name: 'AStop') required bool aStop,
    @JsonKey(name: 'EStop') required bool eStop,
    @JsonKey(name: 'Bypass') required bool bypass,
    @JsonKey(name: 'Team') Team? team,
    @JsonKey(name: 'WifiStatus') required WifiStatus wifiStatus,
    @JsonKey(name: 'GameData') @Default('') String gameData,
  }) = _AllianceStation;

  factory AllianceStation.fromJson(Map<String, dynamic> json) =>
      _$AllianceStationFromJson(json);
}

@freezed
abstract class WifiStatus with _$WifiStatus {
  const factory WifiStatus({
    @JsonKey(name: 'TeamId') required int teamId,
    @JsonKey(name: 'RadioLinked') required bool radioLinked,
    @JsonKey(name: 'MBits', fromJson: _numToDouble) @Default(0.0) double mBits,
    @JsonKey(name: 'RxRate', fromJson: _numToDouble) @Default(0.0) double rxRate,
    @JsonKey(name: 'TxRate', fromJson: _numToDouble) @Default(0.0) double txRate,
    @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble)
    @Default(0.0)
    double signalNoiseRatio,
    @JsonKey(name: 'ConnectionQuality') @Default(0) int connectionQuality,
  }) = _WifiStatus;

  factory WifiStatus.fromJson(Map<String, dynamic> json) =>
      _$WifiStatusFromJson(json);
}

@freezed
abstract class DriverStationConnection with _$DriverStationConnection {
  const factory DriverStationConnection({
    @JsonKey(name: 'DsLinked') required bool dsLinked,
    @JsonKey(name: 'RioLinked') @Default(false) bool rioLinked,
    @JsonKey(name: 'RobotLinked') required bool robotLinked,
    @JsonKey(name: 'RadioLinked') required bool radioLinked,
    @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble)
    required double batteryVoltage,
    @JsonKey(name: 'DsRobotTripTimeMs') required int dsRobotTripTimeMs,
    @JsonKey(name: 'MissedPacketCount') required int missedPacketCount,
  }) = _DriverStationConnection;

  factory DriverStationConnection.fromJson(Map<String, dynamic> json) =>
      _$DriverStationConnectionFromJson(json);
}

// ─── Team ────────────────────────────────────────────────────────────────────

@freezed
abstract class Team with _$Team {
  const factory Team({
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
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
