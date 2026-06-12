import 'package:arena_link/app.dart';
import 'package:arena_link/helpers/local_storage.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // Ensure flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Keep the render loop alive even when the window is not in focus.
  // On desktop, Flutter throttles (or pauses) frame production when the
  // window loses focus. For a field monitor that must update continuously
  // on an unattended display, we schedule the next frame from within each
  // frame callback so the engine never goes idle.
  SchedulerBinding.instance.addPersistentFrameCallback((_) {
    SchedulerBinding.instance.scheduleFrame();
  });

  // Init local storage
  await initializeLocalStorage();

  // Run App
  runApp(ProviderScope(child: App()));
}
