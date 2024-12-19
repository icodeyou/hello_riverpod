import 'package:{{projectName}}/features/kitten/data/repository/x_kitten_repository.dart';
import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_controller.g.dart';

@riverpod
class KittenController extends _$KittenController {
  late final _kittenRepository = ref.read(kittenRepositoryProvider);

  @override
  Future<Kitten> build() async {
    return _kittenRepository.getKittenById(1);
  }

  Future<void> updateKitten(Kitten kitten) async {
    final kittenResponse = await _kittenRepository.saveKitten(kitten);
    state = AsyncData(kittenResponse);
  }
}
