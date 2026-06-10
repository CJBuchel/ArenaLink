import 'package:arena_link/app.dart';
import 'package:arena_link/helpers/local_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // Ensure flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Init logger

  // Init local storage
  await initializeLocalStorage();

  // Run App
  runApp(ProviderScope(child: App()));
}
