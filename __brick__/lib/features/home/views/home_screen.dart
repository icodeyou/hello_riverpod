import 'package:flutter/material.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Widget for Home Screen
class HomeScreen extends StatelessWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({
    super.key,
    required this.title,
  });

  /// The text to display
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pixinbox')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.showToast('Hey !'),
        child: const Icon(Icons.star),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(t.home.hello),
          ],
        ),
      ),
    );
  }
}
