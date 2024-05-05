import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsThemeFunc {
  void setThemeMode(bool themeMode);
  bool getThemeMode();
}

class SharedPrefsThemeFuncImpl extends SharedPrefsThemeFunc {
  @override
  bool getThemeMode() {
    return AppSharedPreference.shared.get(SharedPreferencesStrings.isDarkMode)
        as bool;
  }

  @override
  void setThemeMode(bool themeMode) {
    AppSharedPreference.shared.save(
      SharedPreferencesStrings.isDarkMode,
      themeMode,
    );
  }
}
