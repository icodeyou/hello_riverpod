import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/features/kitten/ui/controllers/kitten_controller.dart';
import 'package:{{projectName}}/features/kitten/ui/controllers/word_controller.dart';

/// Widget for Home Screen
class KittenScreen extends ConsumerWidget {
  const KittenScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kittenNameState = ref.watch(kittenControllerProvider);
    final kittenNotifier = ref.read(kittenControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(t.kitten.appBar)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.kitten.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 110),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(12.0),
                child: kittenNameState.when(
                  data: (kittenName) => AppText.s(
                    kittenName,
                    maxLines: 10,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stackTrace) => const Text('Error'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => kittenNotifier.generateLetter(),
              child: const Text('Generate letter'),
            ),
          ],
        ),
      ),
    );
  }
}
