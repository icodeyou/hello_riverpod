import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/routing/app_routes.dart';
import 'package:{{projectName}}/i18n/translations.g.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// All the colors that are specific to the application.
const themeColors = (
  primary: Colors.teal,
  onPrimary: Colors.white,
  secondary: Colors.orange,
  onSecondary: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
);

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
          theme: getSnowflakeThemeData(ThemeMode.light, themeColors),
          darkTheme: getSnowflakeThemeData(ThemeMode.dark, themeColors),
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
