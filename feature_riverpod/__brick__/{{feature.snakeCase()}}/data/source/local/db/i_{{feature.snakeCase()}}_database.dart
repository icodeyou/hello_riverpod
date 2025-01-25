import '../entity/{{model.snakeCase()}}_entity.dart';

abstract class I{{feature.pascalCase()}}Database {
  Future<List<{{model.pascalCase()}}Entity>> getAll();
  Future<{{model.pascalCase()}}Entity?> getByID(int id);
  Future<void> create({{model.pascalCase()}}Entity {{model.camelCase()}});
  Future<void> update({{model.pascalCase()}}Entity {{model.camelCase()}});
}
