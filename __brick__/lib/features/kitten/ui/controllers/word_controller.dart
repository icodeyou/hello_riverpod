import 'dart:math';

import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:{{projectName}}/features/kitten/domain/services/kitten_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_controller.g.dart';

@riverpod
class WordController extends _$WordController {
  late final _kittenService = ref.read(kittenServiceProvider);

  @override
  Future<String> build() async {
    return _getWord();
  }

  Future<void> generateLetter() async {
    state = const AsyncLoading();
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    var newWord = await _getWord();
    newWord += randomLetter;

    await _saveWord(newWord);
    state = AsyncData(newWord);
  }

  Future<String> _getWord() async {
    final kitten = await _kittenService.getKitten();
    return kitten.name;
  }

  Future<void> _saveWord(String newWord) async {
    _kittenService.save(Kitten(id: 0, name: newWord));
  }
}
