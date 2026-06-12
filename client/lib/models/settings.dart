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
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
