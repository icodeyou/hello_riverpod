import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_local/features/kitten/data/dto/kitten_dto.dart';
import 'package:project_local/features/kitten/domain/models/kitten.dart';
import 'package:project_local/shared/constants/shared_preferences_keys.dart';
import 'package:project_local/shared/extensions/ref_extensions.dart';
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
    final kittenDto = KittenDto(id: 0, name: 'name');
    return kittenFromDto(kittenDto);
  }

  Future<Kitten> saveKitten(Kitten kitten) async {
    // Simulate a network POST request
    await Future.delayed(const Duration(milliseconds: 300));

    // The POST request would return the new kitten
    return kitten;
  }
}

Kitten kittenFromDto(KittenDto dto) {
  return Kitten(id: dto.id, name: dto.name);
}
