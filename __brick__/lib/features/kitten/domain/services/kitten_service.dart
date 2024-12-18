import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_local/features/kitten/data/repository/x_kitten_repository.dart';
import 'package:project_local/features/kitten/domain/models/kitten.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_service.g.dart';

@riverpod
KittenService kittenService(Ref ref) {
  return KittenService(ref);
}

class KittenService {
  KittenService(this.ref);

  final Ref ref;
  late final kittenRepository = ref.read(kittenRepositoryProvider);

  Future<Kitten> save(Kitten kitten) async {
    final kittenResponse = await kittenRepository.saveKitten(kitten);
    return kittenResponse;
  }

  Future<Kitten> getKitten() async {
    var kitten = await kittenRepository.getKittenById(1);

    // Create the kitten if it doesn't exist
    const newKitten = Kitten(id: 1, breed: 'Birman');
    kitten ??= await kittenRepository.registerNewKitten(newKitten);

    return kitten;
  }
}
