import 'package:flutter/widgets.dart';
import 'package:{{projectName}}/app/init/shared_preferences/shared_preferences_provider.dart';
import 'package:{{projectName}}/app/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

/// Provider used for app initialization
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  await _initApp();
  await _initProviders(ref);
}

/// Configure the app during SplashScreen, before initialization of widgets
Future<void> _initApp() async {
  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), stackTrace: details.stack);
  };
}

Future<void> _initProviders(AppStartupRef ref) async {
  // Declare all initial providers
  final initialProviders = [sharedPreferencesProvider];

  // Invalidate all providers when appStartupProvider is disposed
  ref.onDispose(() {
    initialProviders.forEach(ref.invalidate);
  });

  // Asynchronously wait for initialization of all providers
  await Future.wait(initialProviders.map((p) => ref.watch(p.future)));
}
