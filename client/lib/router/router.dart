import 'package:arena_link/base/base_scaffold.dart';
import 'package:arena_link/router/app_routes.dart';
import 'package:arena_link/router/deferred_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Deferred
import 'package:arena_link/views/field_monitor/field_monitor_view.dart'
    deferred as fieldMonitor;
import 'package:arena_link/views/settings/settings_view.dart'
    deferred as settingsView;

part 'router.g.dart';

/// Wrapper that delays showing the child until it has completed its first build.
///
/// This prevents the animation from starting while the widget is still building,
/// which would cause visible jank. The widget builds off-screen first, then
/// the animation reveals it smoothly.
class _DelayedAnimationWrapper extends HookWidget {
  final Widget child;

  const _DelayedAnimationWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    final isReady = useState(false);

    useEffect(() {
      // Wait for the widget to complete its first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isReady.value = true;
      });
      return null;
    }, []);

    if (!isReady.value) {
      // Widget is building - show it invisibly so it can complete its build
      return Opacity(opacity: 0.0, child: child);
    }

    // Widget is ready - show it normally and let the animation proceed
    return child;
  }
}

/// Creates a page with a fade + slide up transition.
///
/// The animation waits for the widget to complete its first build before
/// starting, ensuring smooth transitions without visible widget rebuilds.
CustomTransitionPage<void> _buildTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: _DelayedAnimationWrapper(child: child),
    transitionDuration: const Duration(milliseconds: 350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
          child: SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(0.0, 0.03),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
            child: child,
          ),
        ),
      );
    },
  );
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: AppRoute.fieldMonitor.path,
    routes: <RouteBase>[
      // Shell Routes (for standard displays)
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: BaseScaffold(state: state, child: child),
          );
        },
        routes: [
          GoRoute(
            name: AppRoute.fieldMonitor.name,
            path: AppRoute.fieldMonitor.path,
            pageBuilder: (context, state) => _buildTransitionPage(
              key: state.pageKey,
              child: DeferredWidget(
                libraryKey: AppRoute.fieldMonitor.path,
                libraryLoader: fieldMonitor.loadLibrary,
                builder: (context) => fieldMonitor.FieldMonitorView(),
              ),
            ),
          ),
          GoRoute(
            name: AppRoute.settings.name,
            path: AppRoute.settings.path,
            pageBuilder: (context, state) => _buildTransitionPage(
              key: state.pageKey,
              child: DeferredWidget(
                libraryKey: AppRoute.settings.path,
                libraryLoader: settingsView.loadLibrary,
                builder: (context) => settingsView.SettingsView(),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
