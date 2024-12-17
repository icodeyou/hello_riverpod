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
    // Simulate a network GET request
    await Future.delayed(const Duration(milliseconds: 2000));
    final name = ref.prefs.getString(SharedPreferencesKeys.spKittenName) ?? '';
    final kittenDto = KittenDTO(id: 0, name: name);
    return kittenFromDto(kittenDto);
  }

  Future<String> saveKitten(Kitten kitten) async {
    // Simulate a network POST request
    await Future.delayed(const Duration(milliseconds: 300));
    await ref.prefs.setString(SharedPreferencesKeys.spKittenName, kitten.name);

    // The POST request would return the name of the kitten
    return kitten.name;
  }
}

Kitten kittenFromDto(KittenDTO dto) {
  return Kitten(id: dto.id, name: dto.name);
}
