import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
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
          Text(
            SettingsStrings.touchIdTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Text(
            SettingsStrings.touchIdSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Lottie.asset(SettingsImages.fingerId),
          Expanded(
            child: Text(
              SettingsStrings.touchIdTip,
              style: Theme.of(context).textTheme.bodyLarge,
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
