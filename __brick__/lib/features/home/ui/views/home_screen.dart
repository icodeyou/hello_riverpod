import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/app/navigation/paths.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Widget for Home Screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

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
                Notif.showToast(context: context, t.home.floatingActionButton);
              },
              child: const Text('Show toast'),
            ),
            ElevatedButton(
              onPressed: () {
                Notif.showPopup(
                  context: context,
                  title: 'Title',
                  content: 'Hello',
                  confirmButton: 'OK',
                  cancelButton: 'Cancel',
                  onConfirm: () => print('Confirm'),
                );
              },
              child: const Text('Show popup'),
            ),
          ],
        ),
      ),
    );
  }
}
