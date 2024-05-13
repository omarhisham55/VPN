import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
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
          color: ThemeController.isDarkTheme ? NeutralColors.grey200.withOpacity(0.4) : null,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(color: PrimaryColors.primary500),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  MainStrings.changeLocation,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: PrimaryColors.primary500,
                      fontWeight: FontWeight.w500),
                ),
                const Icon(
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
