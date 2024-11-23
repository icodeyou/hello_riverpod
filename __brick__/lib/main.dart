import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:{{projectName}}/app/startup/views/app_startup_scope.dart';
import 'package:{{projectName}}/app/utils/log.dart';

void main() {
  runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      runApp(const AppStartupScope());
    },
    (error, stackTrace) => logger.e(error.toString(), stackTrace: stackTrace),
  );
}
