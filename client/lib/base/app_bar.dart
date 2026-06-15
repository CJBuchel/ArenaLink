import 'package:arena_link/providers/arena_provider.dart';
import 'package:arena_link/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/colors.dart';

class BaseAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final GoRouterState state;
  final bool showActions;

  const BaseAppBar({super.key, required this.state, this.showActions = true});

  List<Widget> _actions(BuildContext context) {
    if (!showActions) return [];
    return [
      IconButton(
        icon: const Icon(Icons.settings_outlined),
        tooltip: 'Settings',
        onPressed: () => AppRoute.settings.push(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canPop  = context.canPop();
    final arena   = ref.watch(arenaProvider);

    return AppBar(
      backgroundColor: null,
      automaticallyImplyLeading: false,
      leadingWidth: canPop ? 56 : 260,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              tooltip: 'Back',
              onPressed: () => context.pop(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _StatusTile.server(arena.connection),
                  const SizedBox(width: 6),
                  _StatusTile.fms(arena.connection, arena.fmsConnected),
                ],
              ),
            ),
      title: const Text("ArenaLink"),
      actions: canPop ? [] : _actions(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ─── Status tiles ─────────────────────────────────────────────────────────────
//
// Two compact tiles shown in the app bar title row:
//   Server — reflects Flutter↔ArenaLink WS connection
//   FMS    — reflects ArenaLink↔FMS connection (from server JSON)

class _StatusTile extends StatelessWidget {
  final String prefix;   // dim label e.g. "Server"
  final String sublabel; // status text e.g. "Online"
  final Color color;
  final String tooltip;

  const _StatusTile._({
    required this.prefix,
    required this.sublabel,
    required this.color,
    required this.tooltip,
  });

  factory _StatusTile.server(BackendConnectionStatus status) {
    final (color, sublabel, tooltip) = switch (status) {
      BackendConnectionStatus.disconnected  => (arenaRed,   'Offline',       'Not connected to ArenaLink server'),
      BackendConnectionStatus.connecting    => (arenaAmber, 'Connecting…',   'Connecting to ArenaLink server'),
      BackendConnectionStatus.reconnecting  => (arenaAmber, 'Reconnecting…', 'Reconnecting to ArenaLink server'),
      BackendConnectionStatus.connected     => (arenaGreen, 'Online',        'Connected to ArenaLink server'),
    };
    return _StatusTile._(
      prefix: 'Server', sublabel: sublabel,
      color: color, tooltip: tooltip,
    );
  }

  factory _StatusTile.fms(BackendConnectionStatus serverStatus, bool fmsConnected) {
    final serverUp = serverStatus == BackendConnectionStatus.connected;
    final (color, sublabel, tooltip) = switch (true) {
      _ when !serverUp     => (labelMuted, 'Unknown',   'Cannot determine FMS status — server not connected'),
      _ when !fmsConnected => (arenaAmber, 'Offline',   'ArenaLink server running — FMS not connected'),
      _                    => (arenaGreen, 'Connected', 'ArenaLink server is connected to the FMS'),
    };
    return _StatusTile._(
      prefix: 'FMS', sublabel: sublabel,
      color: color, tooltip: tooltip,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: surfaceIdle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: surfaceBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6, height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
            Text(
              prefix,
              style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.w500, color: labelDim),
            ),
            const SizedBox(width: 4),
            Text(
              sublabel,
              style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w700, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
