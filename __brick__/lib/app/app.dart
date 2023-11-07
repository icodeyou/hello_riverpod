import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/routing/app_routes.dart';
import 'package:{{projectName}}/i18n/translations.g.dart';

/// The primary color of the application.
const primaryColor = Color(0xFF13B9FF);

/// The Widget that configures the application.
class App extends StatelessWidget {
  /// Unique constructor for class App
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: ProviderScope(
        child: MaterialApp.router(
          themeMode: ThemeMode.dark, // type "light" for light mode
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(color: primaryColor),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: primaryColor,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(color: primaryColor),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: primaryColor,
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
