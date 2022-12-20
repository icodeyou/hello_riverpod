import 'package:flutter/material.dart';

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter App')),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
