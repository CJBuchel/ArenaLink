import 'package:arena_link/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final canPop = context.canPop();

    return AppBar(
      backgroundColor: null,
      leadingWidth: canPop ? 56 : 120,
      automaticallyImplyLeading: false,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              tooltip: 'Back',
              onPressed: () => context.pop(),
            )
          : null,
      title: const Text("ArenaLink"),
      actions: canPop ? [] : _actions(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
