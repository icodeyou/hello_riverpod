import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/app/navigation/app_routes.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// All the colors that are specific to the application in light mode.
const lightColors = (
  primary: Color(0xFF14C2A5),
  onPrimary: ThemeColors.white,
  secondary: Color(0xFF6E22DA),
  onSecondary: ThemeColors.white,
  background: Color(0xFFEDF3F5),
  onBackground: Color(0xFF2F2F2F),
);

/// All the colors that are specific to the application in dark mode.
const darkColors = (
  primary: Color(0xFF14C2A5),
  onPrimary: ThemeColors.white,
  secondary: Color(0xFF6E22DA),
  onSecondary: ThemeColors.white,
  background: Color(0xFF2F2F2F),
  onBackground: Color(0xFFEDF3F5),
);

/// The Widget that configures the application.
class App extends StatelessWidget {
  /// Constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: ProviderScope(
        child: MaterialApp.router(
          themeMode: ThemeMode.light,
          theme: getSnowflakeThemeData(
            mode: ThemeMode.light,
            appColors: lightColors,
          ),
          darkTheme: getSnowflakeThemeData(
            mode: ThemeMode.dark,
            appColors: darkColors,
          ),
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
