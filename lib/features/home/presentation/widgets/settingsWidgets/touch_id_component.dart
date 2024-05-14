import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class TouchIdComponent extends StatelessWidget {
  const TouchIdComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextGlobal(
            SettingsStrings.touchIdTitle,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 12),
          const TextGlobal(
            SettingsStrings.touchIdSubtitle,
            style: TextSizeState.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Lottie.asset(SettingsImages.fingerId),
          const Expanded(
            child: TextGlobal(
              SettingsStrings.touchIdTip,
              textAlign: TextAlign.center,
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
