import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_provider.g.dart';

@riverpod
class $Word extends _$$Word {
  @override
  String build() {
    return 'Hello';
  }

  void generateLetter() {
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    state = state + randomLetter;
  }
}
