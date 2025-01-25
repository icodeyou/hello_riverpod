import '../entity/{{model.snakeCase()}}_entity.dart';
import '../../../../domain/models/{{model.snakeCase()}}.dart';

class {{model.pascalCase()}}EntityMapper {
  static {{model.pascalCase()}} fromEntity({{model.pascalCase()}}Entity {{model.camelCase()}}Entity) {
    return {{model.pascalCase()}}(id: {{model.camelCase()}}Entity.id, breed: {{model.camelCase()}}Entity.breed);
  }

  static {{model.pascalCase()}}Entity toEntity({{model.pascalCase()}} {{model.camelCase()}}) {
    return {{model.pascalCase()}}Entity(id: {{model.camelCase()}}.id, breed: {{model.camelCase()}}.breed);
  }
}
