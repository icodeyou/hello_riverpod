import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'x_{{feature.snakeCase()}}_database.dart';
import 'package:{{project}}/shared/data/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{feature.snakeCase()}}_database_provider.g.dart';

@riverpod
X{{feature.pascalCase()}}Database {{feature.camelCase()}}Database(Ref ref) {
  final localDatabase = ref.watch(localDatabaseProvider);
  return X{{feature.pascalCase()}}Database(localDatabase);
}
