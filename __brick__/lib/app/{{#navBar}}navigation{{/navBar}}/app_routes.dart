import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/navigation/app_bottom_bar_scaffold.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';
import 'package:{{projectName}}/features/home/views/home_screen.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {
  // Navigator Keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorAlbums =
      GlobalKey<NavigatorState>(debugLabel: 'shellAlbums');
  static final _shellNavigatorSort =
      GlobalKey<NavigatorState>(debugLabel: 'shellSort');
  static final _shellNavigatorTag =
      GlobalKey<NavigatorState>(debugLabel: 'shellTag');

  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
    initialLocation: Paths.home.path,
    navigatorKey: _rootNavigatorKey,
    observers: [BotToastNavigatorObserver()], // init bot_toast (2)
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomBarScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAlbums,
            routes: [
              GoRoute(
                path: Paths.home.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Albums');
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSort,
            routes: [
              GoRoute(
                path: Paths.explore.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Sort');
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorTag,
            routes: [
              GoRoute(
                path: Paths.settings.path,
                builder: (context, state) {
                  return const HomeScreen(title: 'Tag');
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
