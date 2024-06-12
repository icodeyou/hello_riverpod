import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/features/kitten/ui/controllers/word_controller.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

class KittenScreen extends ConsumerWidget {
  const KittenScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordState = ref.watch(wordControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.kitten.appBar)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.l(
              t.kitten.title,
              bold: true,
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
                margin: ThemeSizes.s.asInsets,
                padding: ThemeSizes.s.asInsets,
                child: wordState.when(
                  data: (word) => AppText.s(
                    word,
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
              onPressed: () =>
                  ref.read(wordControllerProvider.notifier).generateLetter(),
              child: const Text('Generate letter'),
            ),
          ],
        ),
      ),
    );
  }
}
