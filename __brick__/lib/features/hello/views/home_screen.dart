import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/features/home/providers/word_provider.dart';

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
    final $wordState = ref.watch($wordProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.common.appName)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read($wordProvider.notifier).generateLetter();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.home.floatingActionButton),
            ),
          );
        },
        child: const Icon(Icons.star),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Notif.showPopup(
                  context: context,
                  title: 'Title',
                  content: 'Hello',
                  confirmButton: 'OK',
                  cancelButton: 'Cancel',
                  onConfirm: () => print('Confirm'),
                );
              },
            ),
            const SizedBox(height: 20),
            $wordState.when(
              data: (word) => Text(word),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => const Text('Error'),
            ),
          ],
        ),
      ),
    );
  }
}
