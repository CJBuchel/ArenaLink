import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    // ArenaLink server (Rust backend) — the only connection the app needs.
    @Default('localhost') String serverHost,
    @Default(9090) int serverPort,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
