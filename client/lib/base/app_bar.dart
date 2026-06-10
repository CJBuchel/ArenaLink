import 'package:arena_link/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final GoRouterState state;
  final bool showActions;

  const BaseAppBar({super.key, required this.state, this.showActions = true});

  List<Widget> _actions() {
    if (!showActions) return [];
    return [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = true;

    return AppBar(
      backgroundColor: isConnected ? null : supportErrorColor,
      leadingWidth: 120,
      leading: Text("Leading"),
      title: Text("Title"),
      actions: _actions(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
