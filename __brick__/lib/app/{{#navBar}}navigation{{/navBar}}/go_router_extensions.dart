import 'package:go_router/go_router.dart';

/// All extensions regarding GoRouter
extension GoRouterLocation on GoRouter {
  // We do this while we wait for an extension from the library
  // https://github.com/flutter/flutter/issues/129833

  /// The current location in the app
  String get location {
    final lastMatch = routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
