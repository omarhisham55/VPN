import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharefdPrefs {
  Object? get(String key);
  Future<bool> save(String key, var value);
  Future<bool> delete(String key);
}

class AppSharedPreference extends AppSharefdPrefs {
  final SharedPreferences sharedPrefs;

  AppSharedPreference({required this.sharedPrefs});

  @override
  Future<bool> delete(String key) async {
    return await sharedPrefs.remove(key);
  }

  @override
  Object? get(String key) {
    return sharedPrefs.containsKey(key) ? sharedPrefs.get(key) : false;
  }

  @override
  Future<bool> save(String key, var value) {
    return switch (value) {
      String() => sharedPrefs.setString(key, value),
      bool() => sharedPrefs.setBool(key, value),
      int() => sharedPrefs.setInt(key, value),
      double() => sharedPrefs.setDouble(key, value),
      Object() => Future.value(false),
      null => Future.value(false),
    };
  }
}
