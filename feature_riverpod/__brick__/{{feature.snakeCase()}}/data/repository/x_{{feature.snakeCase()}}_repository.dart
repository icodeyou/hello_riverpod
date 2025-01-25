import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../source/local/db/x_{{feature.snakeCase()}}_database.dart';
import '../source/local/db/{{feature.snakeCase()}}_database_provider.dart';
import '../source/local/mapper/{{model.snakeCase()}}_entity_mapper.dart';
import '../../domain/models/{{model.snakeCase()}}.dart';
import '../../domain/repository/i_{{feature.snakeCase()}}_repository.dart';

part 'x_{{feature.snakeCase()}}_repository.g.dart';

@riverpod
X{{feature.pascalCase()}}Repository {{feature.camelCase()}}Repository(Ref ref) {
  final {{feature.camelCase()}}DB = ref.watch({{feature.camelCase()}}DatabaseProvider);
  return X{{feature.pascalCase()}}Repository({{feature.camelCase()}}DB);
}

class X{{feature.pascalCase()}}Repository implements I{{feature.pascalCase()}}Repository {
  X{{feature.pascalCase()}}Repository(this.{{feature.camelCase()}}DB);

  final X{{feature.pascalCase()}}Database {{feature.camelCase()}}DB;

  @override
  Future<List<{{model.pascalCase()}}>> get{{model.pascalCase()}}s() async {
    // Simulate a network GET request
    await Future.delayed(const Duration(milliseconds: 2000));

    final {{model.camelCase()}} = await {{feature.camelCase()}}DB.getAll();
    return {{model.camelCase()}}.map((k) => {{model.pascalCase()}}EntityMapper.fromEntity(k)).toList();
  }

  @override
  Future<{{model.pascalCase()}}> get{{model.pascalCase()}}ById(int id) async {
    final {{model.camelCase()}}Entity = await {{feature.camelCase()}}DB.getByID(id);
    if ({{model.camelCase()}}Entity == null) {
      // Create the {{model.camelCase()}} if it doesn't exist
      final {{model.camelCase()}} = {{model.pascalCase()}}(id: 1, breed: 'Birman');
      await registerNew{{model.pascalCase()}}({{model.camelCase()}});
      return {{model.camelCase()}};
    }
    return {{model.pascalCase()}}EntityMapper.fromEntity({{model.camelCase()}}Entity);
  }

  @override
  Future<void> registerNew{{model.pascalCase()}}({{model.pascalCase()}} {{model.camelCase()}}) async {
    await {{feature.camelCase()}}DB.create({{model.pascalCase()}}EntityMapper.toEntity({{model.camelCase()}}));
  }

  @override
  Future<void> save{{model.pascalCase()}}({{model.pascalCase()}} {{model.camelCase()}}) async {
    // Simulate a network POST request
    await Future.delayed(const Duration(milliseconds: 300));

    await {{feature.camelCase()}}DB.update({{model.pascalCase()}}EntityMapper.toEntity({{model.camelCase()}}));
  }
}
