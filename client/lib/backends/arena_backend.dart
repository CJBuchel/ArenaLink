import 'package:arena_link/models/arena_state.dart';

/// Abstract arena backend.
/// Each vendor backend (Cheesy Arena, FMS, etc.) implements this interface.
/// [arenaProvider] creates the appropriate backend from [AppSettings] and
/// delegates all arena state through it.
abstract class ArenaBackend {
  /// Most recent full state snapshot.
  Arena get state;

  /// Broadcast stream of state updates.
  Stream<Arena> get stateStream;

  /// Open connections to the arena at [host]:[port].
  void connect(String host, int port);

  /// Close all connections without releasing resources.
  void disconnect();

  /// Close and immediately re-open all connections.
  void reconnect();

  /// Release all resources. Must not be used after calling this.
  void dispose();
}
