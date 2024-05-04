import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/dropdown_button.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/face_id_component.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/pin_security_component.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/touch_id_component.dart';

class SettingsWidgets {
  static Scaffold settings(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(
        context: context,
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: SettingsStrings.settingTitle.map((title) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    SettingsCubit settings = SettingsCubit.get(context);
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        rowEnding(context, title, settings),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  static Widget rowEnding(
      BuildContext context, String title, SettingsCubit settings) {
    return switch (title) {
      'Language' => const DropDownSetting<String>(
          items: ['English', 'Arabic'],
        ),
      'Connection Mode' => const DropDownSetting<String>(
          items: ['IPSec', 'Lan'],
        ),
      'Notification' => Switch.adaptive(
          value: settings.notificationSwitch,
          onChanged: settings.toggleNotificationSwitch,
        ),
      'Dark Mode' => Switch.adaptive(
          value: settings.darkModeSwitch,
          onChanged: settings.toggleDarkModeSwitch,
        ),
      'Face ID' => Switch.adaptive(
          value: settings.faceIdSwitch,
          onChanged: (value) => settings.toggleFaceIdSwitch(context, value),
        ),
      'Touch ID' => Switch.adaptive(
          value: settings.touchIdSwitch,
          onChanged: (value) => settings.toggleTouchIdSwitch(context, value),
        ),
      'Pin Security' => Switch.adaptive(
          value: settings.pinSecurity,
          onChanged: (value) => settings.togglePinSecuritySwitch(context, value),
        ),
      'Terms of Service' || 'Privacy Policy' || 'About App' => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(Icons.chevron_right),
        ),
      String() => Container(),
    };
  }

  static Widget settingsPanel(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SwitchState && state.state) {
          SettingsCubit.get(context).setSelectedRow(state.title);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              const PanelHeader(),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: switch (SettingsCubit.get(context).selectedRow) {
                  'faceId' => const FaceIdComponent(),
                  'touchId' => const TouchIdComponent(),
                  'pinSecurity' => const PinSecurityComponent(),
                  String() => Container()
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
