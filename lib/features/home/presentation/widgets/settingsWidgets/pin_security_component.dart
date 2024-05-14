import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/pin_code_field.dart';

class PinSecurityComponent extends StatelessWidget {
  const PinSecurityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextGlobal(
            SettingsStrings.pinSecurityTitle,
            style: TextSizeState.bodyMedium,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 12),
          const TextGlobal(
            SettingsStrings.pinSecuritySubtitle,
            style: TextSizeState.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: PinCode(
                manager: SettingsCubit.get(context),
              ),
            ),
          ),
          DefualtAppButton(
            text: 'save',
            onPressed: () {},
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
