import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/config/routes/settings_routes.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  HomeCubit homeCubit(context) => HomeCubit.get(context);
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  String selectedRow = '';
  bool notificationSwitch = false;
  bool darkModeSwitch = false;
  bool faceIdSwitch = false;
  bool touchIdSwitch = false;
  bool pinSecurity = false;
  bool isPincodeButtonDisabled = false;
  List<TextEditingController> pinCode =
      List.generate(4, (index) => TextEditingController());

  void setSelectedRow(String title) {
    selectedRow = title;
    emit(SwitchState(title: title, state: true));
  }

  void toggleNotificationSwitch(bool value) {
    notificationSwitch = value;
    emit(SwitchState(title: 'notification', state: notificationSwitch));
  }

  void toggleDarkModeSwitch(bool value) {
    darkModeSwitch = value;
    emit(SwitchState(title: 'darkMode', state: darkModeSwitch));
  }

  void toggleFaceIdSwitch(BuildContext context, bool value) {
    faceIdSwitch = value;
    if (faceIdSwitch) {
      homeCubit(context).openPanel(800);
    }
    emit(SwitchState(title: 'faceId', state: faceIdSwitch));
  }

  void toggleTouchIdSwitch(BuildContext context, bool value) {
    touchIdSwitch = value;
    if (touchIdSwitch) homeCubit(context).openPanel(800);
    emit(SwitchState(title: 'touchId', state: touchIdSwitch));
  }

  void togglePinSecuritySwitch(BuildContext context, bool value) {
    pinSecurity = value;
    if (pinSecurity) homeCubit(context).openPanel(600);
    emit(SwitchState(title: 'pinSecurity', state: pinSecurity));
  }

  void setPinCodeButtonDisabled() {
    // ignore: collection_methods_unrelated_type
    pinCode.contains(TextEditingValue.empty)
        ? isPincodeButtonDisabled = true
        : isPincodeButtonDisabled = false;
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
