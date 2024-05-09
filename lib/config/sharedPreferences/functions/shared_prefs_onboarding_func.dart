import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsOnboardingFunc {
  void setOnboardingDone();
  bool getOnboardingDone();
}

class SharedPrefsOnboardingFuncImpl extends SharedPrefsOnboardingFunc {
  final AppSharefdPrefs appSharedPrefs;

  SharedPrefsOnboardingFuncImpl({required this.appSharedPrefs});
  @override
  bool getOnboardingDone() {
    return appSharedPrefs.get(SharedPreferencesStrings.isBoardingComplete)
        as bool;
  }

  @override
  void setOnboardingDone() {
    appSharedPrefs.save(
      SharedPreferencesStrings.isBoardingComplete,
      true,
    );
  }
}
