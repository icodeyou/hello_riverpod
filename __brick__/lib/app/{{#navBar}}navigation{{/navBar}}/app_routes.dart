import 'package:bot_toast/bot_toast.dart';
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
    observers: [BotToastNavigatorObserver()], // init bot_toast (2)
    routes: [
      GoRoute(
        // If a page is invalid, go_router will suggest to go to '/'
        path: '/',
        redirect: (context, state) => Paths.home.path,
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
                  name: Paths.home.location,
                  builder: (context, state) {
                    return const HomeScreen();
                  },
                  routes: [
                    GoRoute(
                      path: Paths.kitten.path,
                      name: Paths.kitten.location,
                      builder: (context, state) {
                        return const KittenScreen();
                      },
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExplore,
            routes: [
              GoRoute(
                path: Paths.explore.path,
                name: Paths.explore.location,
                builder: (context, state) {
                  return const Scaffold(body: Center(child: Text('Explore')));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: [
              GoRoute(
                path: Paths.settings.path,
                name: Paths.settings.location,
                builder: (context, state) {
                  return const Scaffold(body: Center(child: Text('Settings')));
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
