import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';
import 'package:{{projectName}}/features/kitten/domain/services/kitten_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_controller.g.dart';

@riverpod
class KittenController extends _$KittenController {
  late final _kittenService = ref.read(kittenServiceProvider);

  @override
  Future<String> build() async {
    final kitten = await _kittenService.getKitten();
    return kitten.name;
  }

  Future<void> updateKitten(String name) async {
    final result = await _kittenService.save(Kitten(id: 0, name: name));
    state = AsyncData(result);
  }
}
