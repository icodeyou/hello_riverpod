import 'package:go_router/go_router.dart';

/// A class that represents a path to a screen in the app.
class Path {
  /// Unique constructor for class Path
  const Path({
    required this.path,
    required this.location,
  });

  /// The path of the screen, corresponding to [GoRoute.path] parameter.
  final String path;

  /// The location, corresponding to [GoRouter.namedLocation] parameter.
  final String location;
}

/// A class that contains all the paths of the app.
class Paths {
  /// Home path
  static Path get home => const Path(
        path: '/home', // This is an absolute path
        location: 'home_screen',
      );

  /// Explore path
  static Path get explore => const Path(
        path: '/explore',
        location: 'explore_screen',
      );

  /// Settings path
  static Path get settings => const Path(
        path: '/settings',
        location: 'settings_screen',
      );

  /// Kitten path. Pushed from home, the location will be '/home/kitten'
  static Path get kitten => const Path(
        path: 'kitten', // This is a relative path
        name: 'kitten_screen',
      );

  // Location parameter becomes handy with dynamic routes
  // Example of dynamic route with user id :
  static Path get profile => const Path(
        path: 'profile/:id', // The path with a dynamic segment
        name: 'profile_screen', // To push a named location
      );
  // To get the location :
  // GoRouter.namedLocation(Paths.profile.name, params: {'id': 42});
  // This outputs : /path/to/profile/42
  //
  // To push :
  // context.pushNamed(Paths.profile.name, params: {'id': 42});
}
