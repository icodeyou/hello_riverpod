import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/ui/constants/strings.dart';
import 'presentation/ui/routing/app_routes.dart';
import 'presentation/ui/styles/app_colors.dart';
import 'presentation/ui/styles/ui_constants.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: UI.textS, fontWeight: FontWeight.w500),
                backgroundColor: AppColors.accent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(UI.buttonCornerRadius)))),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: AppColors.primary, secondary: AppColors.accent),
      ),
    );
  }
}
