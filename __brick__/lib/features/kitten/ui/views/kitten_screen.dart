import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/features/home/ui/controllers/word_controller.dart';

class KittenScreen extends ConsumerWidget {
  const KittenScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final $wordState = ref.watch($wordControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Kitten screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kitten',
              style: const TextStyle(fontWeight: FontWeight.bold),
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
