import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';
import 'package:{{projectName}}/features/hello/views/home_screen.dart';

/// This class is used to defined all the routes of the project
class AppRoutes {
  /// GoRouter instantiation, with associated routes
  static final GoRouter router = GoRouter(
    initialLocation: Paths.home.path,
    routes: [
      GoRoute(
        path: Paths.home.path,
        builder: (context, state) {
          return const HomeScreen(title: 'Home');
        },
      ),
    ],
  );
}
