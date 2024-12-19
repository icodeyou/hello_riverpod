import 'package:{{projectName}}/features/kitten/data/source/local//entity/kitten_entity.dart';
import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';

class KittenEntityMapper {
  static Kitten fromEntity(KittenEntity entity) {
    return Kitten(id: entity.id, breed: entity.breed);
  }

  static KittenEntity toEntity(Kitten kitten) {
    return KittenEntity(id: kitten.id, breed: kitten.breed);
  }
}
