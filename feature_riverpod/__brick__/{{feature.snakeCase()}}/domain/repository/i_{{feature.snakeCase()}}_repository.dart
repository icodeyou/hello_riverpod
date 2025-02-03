import '../models/{{model.snakeCase()}}.dart';

abstract class I{{feature.pascalCase()}}Repository {
  Future<List<{{model.pascalCase()}}>> getAll{{model.pascalCase()}}s();
}
