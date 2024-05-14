import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class LocationFreePremiumButton extends StatefulWidget {
  const LocationFreePremiumButton({super.key});

  @override
  State<LocationFreePremiumButton> createState() =>
      LocationFreePremiumButtonState();
}

class LocationFreePremiumButtonState extends State<LocationFreePremiumButton> {
  bool isFree = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: ThemeController.isDarkTheme
            ? NeutralColors.grey900
            : NeutralColors.grey200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: buttonItem(
              'Free',
              () => setState(() => isFree = true),
              isFree,
              ThemeController.isDarkTheme
                  ? NeutralColors.grey900
                  : NeutralColors.white,
              PrimaryColors.primary500,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buttonItem(
              'Premium',
              () => setState(() => isFree = false),
              !isFree,
              PrimaryColors.primary500,
              NeutralColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonItem(
    String text,
    Function() onTap,
    bool isFree,
    Color activeColor,
    Color activeTextColor,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isFree ? activeColor : null,
          borderRadius: BorderRadius.circular(8),
          border: isFree ? Border.all(color: PrimaryColors.primary400) : null,
        ),
        child: Center(
          child: TextGlobal(
            text,
            style: TextSizeState.titleMedium,
            color: isFree ? activeTextColor : NeutralColors.grey800,
          ),
        ),
      ),
    );
  }
}
