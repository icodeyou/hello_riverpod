import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';

/// Widget for Home Screen
class HomeScreen extends ConsumerWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({
    super.key,
    required this.title,
  });

  /// The text to display
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(t.common.appName)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // We should always use pushNamed rather than push, it's more accurate
          context.pushNamed(Paths.kitten.location);
        },
        child: const Icon(Icons.pets),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.home.floatingActionButton),
                  ),
                );
              },
              child: const Text('Show toast'),
            ),
            // - Other buttons -
          ],
        ),
      ),
    );
  }
}
