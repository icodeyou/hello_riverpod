import 'package:flutter/material.dart';

/// Widget for Home Screen
class HomeScreen extends StatelessWidget {
  /// Unique constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('aaa')),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
