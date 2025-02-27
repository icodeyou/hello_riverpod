import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/init/global_providers/global_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension RefExtensions on Ref {
  SharedPreferences get prefs => read(sharedPreferencesProvider).requireValue;
}

extension WidgetRefExtensions on WidgetRef {
  SharedPreferences get prefs => read(sharedPreferencesProvider).requireValue;
}
