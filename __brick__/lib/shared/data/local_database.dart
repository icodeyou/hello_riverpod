import 'package:path/path.dart';
import 'package:project_local/shared/constants/db_keys.dart';
import 'package:sqflite/sqflite.dart';

typedef Entity = Map<String, Object?>;

class LocalDatabase {
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DBKeys.databaseName),
      onCreate: (db, _) {
        db.execute(
          '''CREATE TABLE ${DBKeys.tableName}(${DBKeys.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ${DBKeys.columnBreed} TEXT NOT NULL)''',
        );
      },
      version: DBKeys.databaseVersion,
    );
  }
}
