import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class ChangeLocationButton extends StatelessWidget {
  final Function() onTap;
  const ChangeLocationButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: onTap,
          color: ThemeController.isDarkTheme
              ? NeutralColors.grey200.withOpacity(0.4)
              : null,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(color: PrimaryColors.primary500),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextGlobal(
                  MainStrings.changeLocation,
                  color: PrimaryColors.primary500,
                  fontWeight: FontWeight.w500,
                ),
                Icon(
                  Icons.arrow_drop_up,
                  color: PrimaryColors.primary500,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
