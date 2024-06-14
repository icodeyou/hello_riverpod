import 'dart:math';

import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:{{projectName}}/features/kitten/domain/services/kitten_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_controller.g.dart';

@riverpod
class KittenController extends _$KittenController {
  late final _kittenService = ref.read(kittenServiceProvider);

  @override
  Future<String> build() async {
    return _getKittenName();
  }

  Future<void> generateLetter() async {
    state = const AsyncLoading();
    final random = Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final randomLetter = letters[random.nextInt(letters.length)];
    var newWord = await _getKittenName();
    newWord += randomLetter;

    await _saveWord(newWord);
    state = AsyncData(newWord);
  }

  Future<String> _getKittenName() async {
    final kitten = await _kittenService.getKitten();
    return kitten.name;
  }

  Future<void> _saveWord(String newWord) async {
    _kittenService.save(Kitten(id: 0, name: newWord));
  }
}
