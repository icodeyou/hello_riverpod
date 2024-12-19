import 'package:{{projectName}}/features/kitten/data/source/local/db/i_kitten_database.dart';
import 'package:{{projectName}}/features/kitten/data/source/local/db/kitten_db_keys.dart';
import 'package:{{projectName}}/features/kitten/data/source/local/entity/kitten_entity.dart';
import 'package:{{projectName}}/shared/data/local_database.dart';
import 'package:sqflite/sqlite_api.dart';

/// Database class for the kitten table
class XKittenDatabase implements IKittenDatabase {
  XKittenDatabase(this.localDatabase);

  final LocalDatabase localDatabase;

  Database? _database;
  Future<Database> getDatabase() async {
    _database ??= await localDatabase.database;
    return _database!;
  }

  @override
  Future<List<KittenEntity>> getAll() async {
    final db = await getDatabase();
    final kittens = await db.query(KittenDbKeys.tableName);
    return kittens.map((e) => KittenEntity.fromJson(e)).toList();
  }

  @override
  Future<KittenEntity?> getByID(int id) async {
    final db = await getDatabase();
    final kittens = await db.query(
      KittenDbKeys.tableName,
      where: '${KittenDbKeys.columnId} = ?',
      whereArgs: [id],
    );
    if (kittens.isEmpty) {
      return null;
    }
    return KittenEntity.fromJson(kittens.first);
  }

  @override
  Future<KittenEntity> create(KittenEntity kitten) async {
    final db = await getDatabase();
    final changesMade = await db.insert(
      KittenDbKeys.tableName,
      kitten.toJson(),
    );

    if (changesMade == 0) {
      throw Exception(
        'This kitten could not be inserted to the database : $kitten',
      );
    }

    return kitten;
  }

  @override
  Future<KittenEntity> update(KittenEntity kitten) async {
    final db = await getDatabase();
    final changesMade = await db.update(
      KittenDbKeys.tableName,
      kitten.toJson(),
      where: 'id = ?',
      whereArgs: [kitten.id],
    );

    if (changesMade != 1) {
      throw Exception('No kitten found with ID : ${kitten.id}');
    }

    return kitten;
  }
}
