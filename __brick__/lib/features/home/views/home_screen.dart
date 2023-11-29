import 'package:flutter/material.dart';
import 'package:{{projectName}}/i18n/translations.g.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Widget for Home Screen
class HomeScreen extends StatelessWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('{{projectName}}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.showToast('Hey !'),
        child: const Icon(Icons.star),
      ),
      body: Center(
        child: Text(t.home.hello),
      ),
    );
  }
}
