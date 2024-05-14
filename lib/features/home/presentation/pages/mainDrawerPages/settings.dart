import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
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
                          child: TextGlobal(title),
                        ),
                        GestureDetector(
                          onTap: () => SettingsCubit.get(context)
                              .intoSettings(context, title),
                          child: rowEnding(context, title, settings),
                        ),
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
    debugPrint('combinedNotifiers: ${settings.combinedNotifiers}');
    return ValueListenableBuilder<List<bool>>(
      valueListenable: settings.combinedNotifiers,
      builder: (context, value, child) {
        return switch (title) {
          'Language' => const DropDownSetting<String>(
              items: ['English', 'Arabic'],
            ),
          'Connection Mode' => const DropDownSetting<String>(
              items: ['IPSec', 'Lan'],
            ),
          'Notification' => Switch.adaptive(
              value: value[0],
              onChanged: settings.toggleNotificationSwitch,
            ),
          'Dark Mode' => ValueListenableBuilder<bool>(
              valueListenable: settings.darkModeSwitch,
              builder: (context, value, child) {
                return Switch.adaptive(
                  value: value,
                  onChanged: settings.toggleDarkModeSwitch,
                );
              },
            ),
          'Face ID' => Switch.adaptive(
              value: value[2],
              onChanged: (value) => settings.toggleFaceIdSwitch(context, value),
            ),
          'Touch ID' => Switch.adaptive(
              value: value[3],
              onChanged: (value) =>
                  settings.toggleTouchIdSwitch(context, value),
            ),
          'Pin Security' => Switch.adaptive(
              value: value[4],
              onChanged: (value) =>
                  settings.togglePinSecuritySwitch(context, value),
            ),
          'Terms of Service' ||
          'Privacy Policy' ||
          'About App' =>
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(Icons.chevron_right),
            ),
          String() => Container(),
        };
      },
    );
  }

  static Widget settingsPanel(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SwitchState && state.state!) {
          SettingsCubit.get(context).setSelectedRow(state.title!);
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
                  String() => null,
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
