import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arena_link/backends/arena_backend.dart';
import 'package:arena_link/backends/cheesy_arena/cheesy_arena_backend.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/models/settings.dart';
import 'package:arena_link/providers/settings_provider.dart';

part 'arena_provider.g.dart';

// Riverpod strips "Notifier" when naming the generated provider, so this
// generates `arenaProvider` — the same name views were already using.
@Riverpod(keepAlive: true)
class ArenaNotifier extends _$ArenaNotifier {
  ArenaBackend? _backend;
  StreamSubscription<Arena>? _sub;

  @override
  Arena build() {
    final settings = ref.watch(appSettingsProvider);
    _initBackend(settings);

    // Reconnect when the app regains visibility, but ONLY if the connection
    // has actually dropped. On Flutter web, AppLifecycleState.resumed fires
    // on every window focus event (including just mousing into the window),
    // so calling reconnect() unconditionally would tear down and re-open the
    // WebSocket on every hover — causing a brief gap where stations show no
    // team data. The watchdog timer in WebSocketHelper handles silent drops;
    // this observer is just a fallback for when the watchdog misses one.
    final observer = _LifecycleObserver(onResume: () {
      if (state.connection == BackendConnectionStatus.disconnected) {
        _backend?.reconnect();
      }
    });
    WidgetsBinding.instance.addObserver(observer);

    ref.onDispose(() {
      _sub?.cancel();
      _backend?.dispose();
      WidgetsBinding.instance.removeObserver(observer);
    });

    return const Arena();
  }

  void _initBackend(AppSettings settings) {
    _sub?.cancel();
    _backend?.dispose();

    _backend = _createBackend(settings.arenaType);
    _sub = _backend!.stateStream.listen((s) => state = s);
    _backend!.connect(settings.arenaHost, settings.arenaPort);
  }

  ArenaBackend _createBackend(ArenaType type) => switch (type) {
    ArenaType.cheesy => CheesyArenaBackend(),
  };

  void reconnect() => _backend?.reconnect();
}

class _LifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback onResume;
  _LifecycleObserver({required this.onResume});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) onResume();
  }
}
