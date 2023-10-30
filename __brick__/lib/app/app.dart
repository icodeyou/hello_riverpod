import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/routing/app_routes.dart';
import 'package:{{projectName}}/i18n/translations.g.dart';

/// The Widget that configures the application.
class App extends StatelessWidget {
  /// Unique constructor for class App
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: ProviderScope(
        child: MaterialApp.router(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          routeInformationProvider: AppRoutes.router.routeInformationProvider,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routerDelegate: AppRoutes.router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: '{{projectName}}',
        ),
      ),
    );
  }
}
