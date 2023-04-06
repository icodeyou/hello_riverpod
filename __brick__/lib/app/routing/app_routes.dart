import 'package:{{projectName}}/features/hello/views/home_screen.dart';
import 'package:go_router/go_router.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {

  /// Home route
  static const String routeHome = '/';

  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
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
