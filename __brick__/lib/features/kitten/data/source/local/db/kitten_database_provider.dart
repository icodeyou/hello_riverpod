import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/features/kitten/data/source/local/db/x_kitten_database.dart';
import 'package:{{projectName}}/shared/data/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_database_provider.g.dart';

@riverpod
XKittenDatabase kittenDatabase(Ref ref) {
  final localDatabase = ref.watch(localDatabaseProvider);
  return XKittenDatabase(localDatabase);
}
