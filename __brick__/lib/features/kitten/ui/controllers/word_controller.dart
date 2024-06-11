import 'dart:math';

import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';
import 'package:{{projectName}}/shared/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_controller.g.dart';

@riverpod
class WordController extends _$WordController {

  late final KittenService _kittenService = ref.read(kittenServiceProvider);

  @override
  Future<String> build() async {
    return _getWord();
  }



  Future<void> generateLetter() async {
    state = const AsyncLoading();
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    final newWord = _getWord() + randomLetter;
    
    await _saveWord();
    state = AsyncData(newWord);
  }

  String _getWord() {
    return ref.prefs.getString(SharedPreferencesKeys.spWord) ?? 'Hello';
  }

  void saveWord() {

  }
}
