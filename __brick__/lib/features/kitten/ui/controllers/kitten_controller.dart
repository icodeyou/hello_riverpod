import 'package:project_local/features/kitten/domain/models/kitten.dart';
import 'package:project_local/features/kitten/domain/services/kitten_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_controller.g.dart';

@riverpod
class KittenController extends _$KittenController {
  late final _kittenService = ref.read(kittenServiceProvider);

  @override
  Future<Kitten> build() async {
    return _kittenService.getKitten();
  }

  Future<void> updateKitten(Kitten kitten) async {
    final kittenResponse = await _kittenService.save(kitten);
    state = AsyncData(kittenResponse);
  }
}
