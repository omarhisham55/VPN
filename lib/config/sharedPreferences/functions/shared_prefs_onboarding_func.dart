import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class SharedPrefsOnboardingFunc {
  void setOnboardingDone();
  bool getOnboardingDone();
}

class SharedPrefsOnboardingFuncImpl
    extends SharedPrefsOnboardingFunc {

  @override
  bool getOnboardingDone() {
    return AppSharedPreference.shared
        .get(SharedPreferencesStrings.isBoardingComplete) as bool;
  }

  @override
  void setOnboardingDone() {
    AppSharedPreference.shared.save(
      SharedPreferencesStrings.isBoardingComplete,
      true,
    );
  }
}
