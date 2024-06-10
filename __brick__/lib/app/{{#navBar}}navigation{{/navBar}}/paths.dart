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
        path: '/home',
        location: '/home',
      );

  /// Explore path
  static Path get explore => const Path(
        path: '/explore',
        location: '/explore',
      );

  /// Settings path
  static Path get settings => const Path(
        path: '/settings',
        location: '/settings',
      );

  /// Kitten path
  static Path get kitten => const Path(
        path: '/kitten',
        location: '/kitten',
      );
}
