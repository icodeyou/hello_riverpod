import 'dart:math';

import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';
import 'package:{{projectName}}/shared/helpers/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_provider.g.dart';

@riverpod
class $Word extends _$$Word {
  @override
  String build() {
    return ref.prefs.getString(SharedPreferencesKeys.spWord) ?? 'Hello';
  }

  void generateLetter() {
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    state = state + randomLetter;
    ref.prefs.setString(SharedPreferencesKeys.spWord, state);
  }
}
