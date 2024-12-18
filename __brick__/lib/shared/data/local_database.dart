import 'package:path/path.dart';
import 'package:project_local/features/kitten/data/source/local/db/kitten_db_keys.dart';
import 'package:project_local/shared/data/db_keys.dart';
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
          '''CREATE TABLE ${KittenDbKeys.tableName}(${KittenDbKeys.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ${KittenDbKeys.columnBreed} TEXT NOT NULL)''',
        );
      },
      version: DBKeys.databaseVersion,
    );
  }
}
