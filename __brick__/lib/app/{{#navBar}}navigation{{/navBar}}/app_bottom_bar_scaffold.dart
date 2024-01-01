import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/navigation/go_router_extensions.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';

/// The root screen that contain the bottom navigation bar
class AppBottomBarScaffold extends StatelessWidget {
  /// Unique constructor
  const AppBottomBarScaffold({
    super.key,
    required this.navigationShell,
  });

  /// The part of the screen above the bottom navigation bar
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).location;

    final bottomTabs = [
      RoutedNavigationBarItem(
        tabRootPath: Paths.home,
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: 'Home',
      ),
      RoutedNavigationBarItem(
        tabRootPath: Paths.explore,
        icon: const Icon(Icons.explore_outlined),
        selectedIcon: const Icon(Icons.explore),
        label: 'Explore',
      ),
      RoutedNavigationBarItem(
        tabRootPath: Paths.settings,
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    int getCurrentIndex() {
      final index = bottomTabs.indexWhere(
        (tab) => currentLocation.startsWith(
          tab.tabRootPath.location,
        ),
      );
      return index == -1 ? 0 : index;
    }

    Path getDestinationPath(int destinationIndex) {
      return bottomTabs[destinationIndex].tabRootPath;
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: getCurrentIndex(),
        destinations: bottomTabs,
        onDestinationSelected: (destinationIndex) {
          context.go(getDestinationPath(destinationIndex).location);
        },
      ),
    );
  }
}

/// A class that represents an item for the bottom navigation bar.
class RoutedNavigationBarItem extends NavigationDestination {
  /// Unique constructor
  const RoutedNavigationBarItem({
    super.key,
    required this.tabRootPath,
    required super.icon,
    required Widget? selectedIcon,
    required super.label,
  }) : super(
          selectedIcon: selectedIcon ?? icon,
        );

  /// The [GoRoute.path] parameter corresponding to the home of the tab.
  final Path tabRootPath;
}
