import 'package:project_local/shared/constants/shared_preferences_keys.dart';
import 'package:project_local/shared/extensions/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<String> build() async {
    return ref.prefs.getString(SharedPreferencesKeys.spUserName) ?? '';
  }

  Future<void> setNewName() async {
    final listOfNames = [
      'John',
      'Jane',
      'Alice',
      'Bob',
      'Charlie',
      'David',
      'Eve',
      'Frank',
      'Grace',
      'Hank',
    ];

    if (state.hasValue) {
      listOfNames.remove(state.value);
    }
    listOfNames.shuffle();
    final newName = listOfNames.first;

    await ref.prefs.setString(SharedPreferencesKeys.spUserName, newName);
    ref.invalidateSelf();
  }
}
