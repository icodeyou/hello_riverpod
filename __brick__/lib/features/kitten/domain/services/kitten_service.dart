import 'package:{{projectName}}/shared/constants/shared_preferences_keys.dart';

part 'timer_service.g.dart';

@riverpod
KittenService kittenService(KittenServiceRef ref) {
  return KittenService(ref);
}

class KittenService {
  KittenService(this.ref);
  
  void save(String newWord) {
    ref.prefs.setString(SharedPreferencesKeys.spWord, newWord)
  }
}
