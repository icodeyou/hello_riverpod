import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';
import 'package:{{projectName}}/features/home/ui/views/home_screen.dart';
import 'package:{{projectName}}/features/kitten/ui/views/kitten_screen.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {
  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
    observers: [BotToastNavigatorObserver()], // init bot_toast (2)
    initialLocation: Paths.home.path,
    routes: [
      GoRoute(
        // If a page is invalid, go_router will suggest to go to '/'
        path: '/',
        redirect: (context, state) => Paths.home.path,
      ),
      GoRoute(
        path: Paths.home.path,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Paths.kitten.path,
        builder: (context, state) {
          return const KittenScreen();
        },
      ),
    ],
  );
}
