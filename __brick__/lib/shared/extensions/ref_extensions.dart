import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/init/shared_preferences/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension RefExtensions on Ref {
  SharedPreferences get prefs => read(sharedPreferencesProvider).requireValue;
}
