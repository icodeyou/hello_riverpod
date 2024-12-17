import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/features/kitten/data/repository/kitten_repository.dart';
import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
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

  Future<void> save(Kitten kitten) async {
    await kittenRepository.saveKitten(kitten);
  }

  Future<Kitten> getKitten() async {
    return kittenRepository.getKitten();
  }
}
