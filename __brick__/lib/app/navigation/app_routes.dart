import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/features/home/views/home_screen.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {
  /// Home route
  static const String routeHome = '/';

  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
    observers: [BotToastNavigatorObserver()], // (2) init bot_toast
    routes: [
      GoRoute(
        path: routeHome,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
