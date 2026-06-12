import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arena_link/helpers/local_storage.dart';
import 'package:arena_link/models/settings.dart';

part 'settings_provider.g.dart';

const _kSettingsKey = 'arena_settings';

@Riverpod(keepAlive: true)
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  AppSettings build() {
    final raw = localStorage.getString(_kSettingsKey);
    if (raw != null) {
      try {
        return AppSettings.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {}
    }
    return const AppSettings();
  }

  Future<void> update(AppSettings settings) async {
    await localStorage.setString(_kSettingsKey, jsonEncode(settings.toJson()));
    state = settings;
  }
}
