import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsThemeFunc {
  void setThemeMode(bool themeMode);
  bool getThemeMode();
}

class SharedPrefsThemeFuncImpl extends SharedPrefsThemeFunc {
  final AppSharefdPrefs appSharedPrefs;

  SharedPrefsThemeFuncImpl({required this.appSharedPrefs});
  @override
  bool getThemeMode() {
    return appSharedPrefs.get(SharedPreferencesStrings.isDarkMode) as bool;
  }

  @override
  void setThemeMode(bool themeMode) {
    appSharedPrefs.save(
      SharedPreferencesStrings.isDarkMode,
      themeMode,
    );
  }
}
