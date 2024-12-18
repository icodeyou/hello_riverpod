import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_local/shared/data/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

@riverpod
LocalDatabase localDatabase(Ref ref) {
  return LocalDatabase();
}
