import 'package:flutter/material.dart';

import '../constants/strings.dart';

class SayHelloPage extends StatelessWidget {
  const SayHelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.titleSayHelloPage)),
      body: const Center(
        child: Text(Strings.contentSayHelloPage),
      ),
    );
  }
}
