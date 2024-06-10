import 'dart:math';

import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';
import 'package:{{projectName}}/shared/helpers/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_controller.g.dart';

@riverpod
class $WordController extends _$$WordController {
  @override
  Future<String> build() async {
    return _getWordFromPref();
  }

  Future<void> generateLetter() async {
    state = const AsyncLoading();
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    final newWord = _getWordFromPref() + randomLetter;
    await ref.prefs.setString(SharedPreferencesKeys.spWord, newWord);
    state = AsyncData(newWord);
  }

  String _getWordFromPref() {
    return ref.prefs.getString(SharedPreferencesKeys.spWord) ?? 'Hello';
  }
}
