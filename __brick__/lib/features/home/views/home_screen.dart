import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:{{projectName}}/features/home/providers/word_provider.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

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
          ref.read($wordProvider.notifier).generateLetter();
          context.showToast(t.home.floatingActionButton);
        },
        child: const Icon(Icons.star),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(ref.watch($wordProvider)),
          ],
        ),
      ),
    );
  }
}
