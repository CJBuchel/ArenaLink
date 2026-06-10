import 'package:arena_link/base/app_bar.dart';
import 'package:arena_link/base/base_rail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseScaffold extends HookConsumerWidget {
  final GoRouterState state;
  final Widget child;
  final bool showActions;
  final bool disableRail;

  const BaseScaffold({
    super.key,
    required this.state,
    required this.child,
    this.showActions = true,
    this.disableRail = false,
  });

  bool _showDrawerInd({bool hasPermissions = true}) {
    return !disableRail && hasPermissions;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppBar(state: state, showActions: showActions),
      body: Stack(
        children: [
          Row(
            children: [
              if (_showDrawerInd()) const SizedBox(width: 48),
              Expanded(child: child),
            ],
          ),
          if (_showDrawerInd()) BaseRail(),
        ],
      ),
    );
  }
}
