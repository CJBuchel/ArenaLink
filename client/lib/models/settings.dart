import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum ArenaType { cheesy }

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ArenaType.cheesy) ArenaType arenaType,
    @Default('localhost') String arenaHost,
    @Default(8080) int arenaPort,
    // UTC offset of the arena server (e.g. 8 for UTC+8).
    // 0 means "use this device's local timezone" (correct when device and
    // server are in the same timezone).  Override when running on a dev
    // machine whose timezone differs from the event venue.
    @Default(0) int serverTimezoneOffsetHours,
    // ArenaLink server (Rust backend) — for pit alerts REST API and WebSocket.
    @Default('localhost') String serverHost,
    @Default(9090) int serverPort,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
