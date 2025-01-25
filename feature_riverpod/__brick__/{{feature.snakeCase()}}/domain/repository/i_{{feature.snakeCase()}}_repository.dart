import '../models/{{model.snakeCase()}}.dart';

abstract class I{{feature.pascalCase()}}Repository {
  Future<List<{{model.pascalCase()}}>> get{{model.pascalCase()}}s();
  Future<{{model.pascalCase()}}?> get{{model.pascalCase()}}ById(int id);
  Future<void> registerNew{{model.pascalCase()}}({{model.pascalCase()}} {{model.camelCase()}});
  Future<void> save{{model.pascalCase()}}({{model.pascalCase()}} {{model.camelCase()}});
}
