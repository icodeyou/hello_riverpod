import 'dart:math';

import 'package:flutter/material.dart';
import 'package:{{projectName}}/features/kitten/ui/controllers/kitten_controller.dart';
import 'package:{{projectName}}/shared/helpers/mutation/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gen_button_controller.g.dart';

enum Status { basic, loading }

@riverpod
class GenButtonController extends _$GenButtonController {
  @override
  Status build() {
    return Status.basic;
  }

  Future<void> generateLetter({
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    state = Status.loading;
    await mutate(
      () async {
        final currentKitten = await ref.read(kittenControllerProvider.future);
        final random = Random();
        const letters = 'abcdefghijklmnopqrstuvwxyz';
        final randomLetter = letters[random.nextInt(letters.length)];
        final newWord = '${currentKitten.breed}$randomLetter';
        await ref
            .read(kittenControllerProvider.notifier)
            .updateKitten(currentKitten.copyWith(breed: newWord));
      },
      onSuccess: onSuccess,
      onError: onError,
    );
    state = Status.basic;
  }
}
