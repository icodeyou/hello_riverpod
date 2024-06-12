import 'package:{{projectName}}/features/kitten/data/repository/kitten_repository.dart';
import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_service.g.dart';

@riverpod
KittenService kittenService(KittenServiceRef ref) {
  return KittenService(ref);
}

class KittenService {
  KittenService(this.ref);

  final KittenServiceRef ref;
  late final kittenRepository = ref.read(kittenRepositoryProvider);

  void save(Kitten kitten) {
    kittenRepository.saveKitten(kitten);
  }

  Future<Kitten> getKitten() async {
    return kittenRepository.getKitten();
  }
}
