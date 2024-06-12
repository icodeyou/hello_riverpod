import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';
import 'package:{{projectName}}/shared/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitten_service.g.dart';

@riverpod
KittenService kittenService(KittenServiceRef ref) {
  return KittenService(ref);
}

class KittenService {
  KittenService(this.ref);

  final KittenServiceRef ref;
  
  void save(String newWord) {
    ref.prefs.setString(SharedPreferencesKeys.spWord, newWord);
  }
}
