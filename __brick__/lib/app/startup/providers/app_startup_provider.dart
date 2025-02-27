import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/init/global_providers/global_providers.dart';
import 'package:{{projectName}}/app/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

/// Provider used for app initialization
@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  await _initApp();
  await _initProviders(ref);
}

/// Asynchronous initialization of the app
Future<void> _initApp() async {
  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), stackTrace: details.stack);
  };
}

Future<void> _initProviders(Ref ref) async {
  // Declare all initial providers
  final futureProviders = [
    sharedPreferencesProvider,
    packageInfoProvider,
  ];

  // Invalidate all providers when appStartupProvider is disposed
  ref.onDispose(() {
    futureProviders.forEach(ref.invalidate);
  });

  // Asynchronously wait for initialization of all providers
  await Future.wait(futureProviders.map((p) => ref.watch(p.future)));
}
