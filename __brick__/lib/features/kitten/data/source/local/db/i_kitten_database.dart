import 'package:{{projectName}}/features/kitten/data/source/local/entity/kitten_entity.dart';

abstract class IKittenDatabase {
  Future<List<KittenEntity>> getAll();
  Future<KittenEntity?> getByID(int id);
  Future<KittenEntity> create(KittenEntity kitten);
  Future<KittenEntity> update(KittenEntity kitten);
}
