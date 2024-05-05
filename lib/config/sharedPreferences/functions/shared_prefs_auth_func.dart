import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsAuthFunc {
  void setUserLogin();
  bool getUserLogin();
}

class SharedPrefsAuthFuncImpl extends SharedPrefsAuthFunc {
  @override
  bool getUserLogin() {
    return AppSharedPreference.shared
        .get(SharedPreferencesStrings.isUserLoggedIn) as bool;
  }

  @override
  void setUserLogin() {
    AppSharedPreference.shared.save(
      SharedPreferencesStrings.isUserLoggedIn,
      true,
    );
  }
}
