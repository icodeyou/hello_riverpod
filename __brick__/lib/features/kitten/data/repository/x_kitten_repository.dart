import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_local/features/kitten/data/source/local/db/kitten_database_provider.dart';
import 'package:project_local/features/kitten/data/source/local/db/x_kitten_database.dart';
import 'package:project_local/features/kitten/data/source/local/mapper/kitten_entity_mapper.dart';
import 'package:project_local/features/kitten/domain/models/kitten.dart';
import 'package:project_local/features/kitten/domain/repository/i_kitten_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'x_kitten_repository.g.dart';

@riverpod
XKittenRepository kittenRepository(Ref ref) {
  final kittenDB = ref.watch(kittenDatabaseProvider);
  return XKittenRepository(kittenDB);
}

class XKittenRepository implements IKittenRepository {
  XKittenRepository(this.kittenDB);

  final XKittenDatabase kittenDB;

  @override
  Future<List<Kitten>> getKittens() async {
    // Simulate a network GET request
    await Future.delayed(const Duration(milliseconds: 2000));

    final kittens = await kittenDB.getAll();
    return kittens.map((k) => KittenEntityMapper.fromEntity(k)).toList();
  }

  @override
  Future<Kitten?> getKittenById(int id) async {
    final kitten = await kittenDB.getByID(id);
    if (kitten == null) {
      return null;
    }
    return KittenEntityMapper.fromEntity(kitten);
  }

  @override
  Future<Kitten> registerNewKitten(Kitten kitten) {
    return kittenDB.create(kitten);
  }

  @override
  Future<Kitten> saveKitten(Kitten kitten) async {
    // Simulate a network POST request
    await Future.delayed(const Duration(milliseconds: 300));

    return kittenDB.update(kitten);
  }
}
