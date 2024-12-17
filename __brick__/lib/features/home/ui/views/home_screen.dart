import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_local/app/i18n/translations.g.dart';
import 'package:project_local/app/navigation/paths.dart';
import 'package:project_local/features/home/ui/controllers/home_controller.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Widget for Home Screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(homeControllerProvider);
    final homeControllerNotifier = ref.read(homeControllerProvider.notifier);

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
            Text(
              '${t.home.welcome} ${name.value}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                homeControllerNotifier.setNewName();
              },
              child: const Text('Change name'),
            ),
            ElevatedButton(
              onPressed: () {
                Notif.showToast(context: context, t.home.heyThere);
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
                  onConfirm: () {
                    Notif.showToast(context: context, t.home.popupConfirmed);
                  },
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
