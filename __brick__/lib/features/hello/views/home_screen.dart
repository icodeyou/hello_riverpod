import 'package:flutter/material.dart';
import 'package:{{projectName}}/l10n/l10n.dart';

/// Widget for Home Screen
class HomeScreen extends StatelessWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: const Text('aaa')),
      body: Center(
        child: Text(l10n.hello),
      ),
    );
  }
}
