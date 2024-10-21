import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/features/kitten/data/dto/kitten_dto.dart';
import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';
import 'package:{{projectName}}/shared/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_repository.g.dart';

@riverpod
KittenRepository kittenRepository(Ref ref) {
  return KittenRepository(ref);
}

class KittenRepository {
  KittenRepository(this.ref);

  final Ref ref;

  Future<Kitten> getKitten() async {
    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 500));
    final name = ref.prefs.getString(SharedPreferencesKeys.spKittenName) ?? '';
    return Kitten(id: 0, name: name);
  }

  Future<void> saveKitten(Kitten kitten) async {
    await ref.prefs.setString(SharedPreferencesKeys.spKittenName, kitten.name);
  }
}

Kitten kittenFromDto(KittenDTO dto) {
  return Kitten(id: dto.id, name: dto.name);
}
