import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class FaceIdComponent extends StatelessWidget {
  const FaceIdComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextGlobal(
            SettingsStrings.faceIdTitle,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 12),
          const TextGlobal(
            SettingsStrings.faceIdSubtitle,
            style: TextSizeState.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Lottie.asset(SettingsImages.faceId),
          const Expanded(
            child: TextGlobal(
              SettingsStrings.faceIdTip,
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
