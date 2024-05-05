import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart' as di;

class AppSharedPreference {
  final SharedPreferences sharedPreferences;

  AppSharedPreference({required this.sharedPreferences});

  static AppSharedPreference shared = AppSharedPreference(
      sharedPreferences: di.DependencyInjection.getIt<SharedPreferences>());
  Future<bool> delete(String key) async {
    return await sharedPreferences.remove(key);
  }

  Object? get(String key) {
    return sharedPreferences.containsKey(key)
        ? sharedPreferences.get(key)
        : false;
  }

  Future<bool> save(String key, var value) {
    return switch (value) {
      String() => sharedPreferences.setString(key, value),
      bool() => sharedPreferences.setBool(key, value),
      int() => sharedPreferences.setInt(key, value),
      double() => sharedPreferences.setDouble(key, value),
      Object() => Future.value(false),
      null => Future.value(false),
    };
  }
}

