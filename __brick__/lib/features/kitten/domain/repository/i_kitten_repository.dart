import 'package:{{projectName}}/features/kitten/domain/models/kitten.dart';

abstract class IKittenRepository {
  Future<List<Kitten>> getKittens();
  Future<Kitten?> getKittenById(int id);
  Future<Kitten> registerNewKitten(Kitten kitten);
  Future<Kitten> saveKitten(Kitten kitten);
}
