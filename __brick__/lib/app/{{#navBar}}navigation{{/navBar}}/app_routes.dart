import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/navigation/app_bottom_bar_scaffold.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';
import 'package:{{projectName}}/features/home/ui/views/home_screen.dart';
import 'package:{{projectName}}/features/kitten/ui/views/kitten_screen.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {
  // Navigator Keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorExplore =
      GlobalKey<NavigatorState>(debugLabel: 'shellExplore');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
    initialLocation: Paths.home.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        // If a page is invalid, go_router will suggest to go to '/'
        path: '/',
        redirect: (context, state) => Paths.home.path,
      ),
      GoRoute(
        path: Paths.kitten.path,
        builder: (context, state) {
          return const KittenScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomBarScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: [
              GoRoute(
                path: Paths.home.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Home');
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExplore,
            routes: [
              GoRoute(
                path: Paths.explore.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Explore');
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: [
              GoRoute(
                path: Paths.settings.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Settings');
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
