import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/say_hello_page.dart';

class AppRoutes {
  static const String routeHome = '/';
  static const String routeSayHello = '/sayHello';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: routeHome,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
    GoRoute(
        path: routeSayHello,
        builder: (BuildContext context, GoRouterState state) {
          return const SayHelloPage();
        }),
  ]);
}
