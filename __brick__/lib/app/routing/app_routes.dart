import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/hello/views/hello_view.dart';

class AppRoutes {
  static const String routeHome = '/';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: routeHome,
        builder: (BuildContext context, GoRouterState state) {
          return const HelloView();
        }),
  ]);
}
