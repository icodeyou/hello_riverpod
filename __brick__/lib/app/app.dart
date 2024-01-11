import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/app/navigation/app_routes.dart';

/// The Widget that configures the application.
class App extends StatelessWidget {
  /// Unique constructor for class App
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: ProviderScope(
        child: MaterialApp.router(
          themeMode: ThemeMode.light,
          routeInformationProvider: AppRoutes.router.routeInformationProvider,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routerDelegate: AppRoutes.router.routerDelegate,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(), // init bot_toast (1)
          title: t.common.appName,
        ),
      ),
    );
  }
}
