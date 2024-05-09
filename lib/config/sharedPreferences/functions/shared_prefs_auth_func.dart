import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsAuthFunc {
  Future<bool> setUserLogin();
  bool getUserLogin();
}

class SharedPrefsAuthFuncImpl implements SharedPrefsAuthFunc {
  final AppSharefdPrefs appSharedPrefs;

  SharedPrefsAuthFuncImpl({required this.appSharedPrefs});
  @override
  bool getUserLogin() {
    return appSharedPrefs.get(SharedPreferencesStrings.isUserLoggedIn) as bool;
  }

  @override
  Future<bool> setUserLogin() {
    return appSharedPrefs.save(
      SharedPreferencesStrings.isUserLoggedIn,
      true,
    );
  }
}
