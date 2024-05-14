import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/config/routes/settings_routes.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/constants/multi_value_notifier.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  HomeCubit homeCubit(context) => HomeCubit.get(context);
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  String selectedRow = '';
  ValueNotifier<bool> notificationSwitch = ValueNotifier<bool>(false);
  ValueNotifier<bool> darkModeSwitch =
      ValueNotifier<bool>(ThemeController.isDarkTheme);
  ValueNotifier<bool> faceIdSwitch = ValueNotifier<bool>(false);
  ValueNotifier<bool> touchIdSwitch = ValueNotifier<bool>(false);
  ValueNotifier<bool> pinSecurity = ValueNotifier<bool>(false);
  ValueNotifier<bool> isPincodeButtonDisabled = ValueNotifier<bool>(false);
  late CombinedValueNotifier combinedNotifiers = CombinedValueNotifier([
    notificationSwitch,
    darkModeSwitch,
    faceIdSwitch,
    touchIdSwitch,
    pinSecurity,
  ]);
  List<TextEditingController> pinCode =
      List.generate(4, (index) => TextEditingController());

  void setSelectedRow(String title) {
    selectedRow = title;
    emit(SwitchState(title: title, state: true));
  }

  void toggleNotificationSwitch(bool value) {
    notificationSwitch.value = value;
  }

  void toggleDarkModeSwitch(bool value) {
    darkModeSwitch.value = value;
    ThemeController.saveTheme(darkModeSwitch.value);
    emit(SwitchState(state: darkModeSwitch.value, title: ''));
  }

  void toggleFaceIdSwitch(BuildContext context, bool value) {
    faceIdSwitch.value = value;
    if (faceIdSwitch.value) {
      homeCubit(context).openPanel(800);
    }
    emit(SwitchState(title: 'faceId', state: value));
  }

  void toggleTouchIdSwitch(BuildContext context, bool value) {
    touchIdSwitch.value = value;
    if (touchIdSwitch.value) homeCubit(context).openPanel(800);
    emit(SwitchState(title: 'touchId', state: value));
  }

  void togglePinSecuritySwitch(BuildContext context, bool value) {
    pinSecurity.value = value;
    if (pinSecurity.value) homeCubit(context).openPanel(600);
    emit(SwitchState(title: 'pinSecurity', state: value));
  }

  void setPinCodeButtonDisabled() {
    // ignore: collection_methods_unrelated_type
    pinCode.contains(TextEditingValue.empty)
        ? isPincodeButtonDisabled.value = true
        : isPincodeButtonDisabled.value = false;
  }

  void intoSettings(BuildContext context, String route) {
    switch (route) {
      case 'Terms of Service':
        AppNavigation.push(context, SettingsRoutes.termsOfService);
        break;
      case 'Privacy Policy':
        AppNavigation.push(context, SettingsRoutes.privacyPolicy);
        break;
      case 'About App':
        AppNavigation.push(context, SettingsRoutes.aboutApp);
        break;
    }
  }
}
