import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_local/features/kitten/data/repository/kitten_repository.dart';
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

  Future<String> save(Kitten kitten) async {
    final kittenResponse = await kittenRepository.saveKitten(kitten);
    return kittenResponse.name;
  }

  Future<Kitten> getKitten() async {
    return kittenRepository.getKitten();
  }
}
