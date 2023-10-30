import 'package:flutter/material.dart';
import 'package:projectsnowball/i18n/translations.g.dart';

/// Widget for Home Screen
class HomeScreen extends StatelessWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('projectsnowball')),
      body: Center(
        child: Text(t.home.hello),
      ),
    );
  }
}
