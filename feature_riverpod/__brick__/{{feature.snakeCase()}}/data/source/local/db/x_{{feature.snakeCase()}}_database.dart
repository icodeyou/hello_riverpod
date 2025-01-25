import 'i_{{feature.snakeCase()}}_database.dart';
import '{{feature.snakeCase()}}_db_keys.dart';
import '../entity/{{model.snakeCase()}}_entity.dart';
import 'package:{{project}}/shared/data/local_database.dart';
import 'package:sqflite/sqlite_api.dart';

/// Database class for the {{feature.camelCase()}} table
class X{{feature.pascalCase()}}Database implements I{{feature.pascalCase()}}Database {
  X{{feature.pascalCase()}}Database(this.localDatabase);

  final LocalDatabase localDatabase;

  Database? _database;
  Future<Database> getDatabase() async {
    _database ??= await localDatabase.database;
    return _database!;
  }

  @override
  Future<List<{{model.pascalCase()}}Entity>> getAll() async {
    final db = await getDatabase();
    final {{model.camelCase()}}s = await db.query({{feature.pascalCase()}}DbKeys.tableName);
    return {{model.camelCase()}}s.map((e) => {{model.pascalCase()}}Entity.fromJson(e)).toList();
  }

  @override
  Future<{{model.pascalCase()}}Entity?> getByID(int id) async {
    final db = await getDatabase();
    final {{model.camelCase()}}s = await db.query(
      {{feature.pascalCase()}}DbKeys.tableName,
      where: '${{{feature.pascalCase()}}DbKeys.columnId} = ?',
      whereArgs: [id],
    );
    if ({{model.camelCase()}}s.isEmpty) {
      return null;
    }
    return {{model.pascalCase()}}Entity.fromJson({{model.camelCase()}}s.first);
  }

  @override
  Future<void> create({{model.pascalCase()}}Entity {{model.camelCase()}}) async {
    final db = await getDatabase();
    final changesMade = await db.insert(
      {{feature.pascalCase()}}DbKeys.tableName,
      {{model.camelCase()}}.toJson(),
    );

    if (changesMade == 0) {
      throw Exception(
        'This {{model.camelCase()}} could not be inserted to the database : ${{model.camelCase()}}',
      );
    }
  }

  @override
  Future<void> update({{model.pascalCase()}}Entity {{model.camelCase()}}) async {
    final db = await getDatabase();
    final changesMade = await db.update(
      {{feature.pascalCase()}}DbKeys.tableName,
      {{model.camelCase()}}.toJson(),
      where: 'id = ?',
      whereArgs: [{{model.camelCase()}}.id],
    );

    if (changesMade != 1) {
      throw Exception('No {{model.camelCase()}} found with ID : ${{{model.camelCase()}}.id}');
    }
  }
}
