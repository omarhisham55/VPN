import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class RoundedAppbarButton extends StatelessWidget {
  final Object icon;
  final Function() onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  const RoundedAppbarButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor = PrimaryColors.primary500,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(CircleBorder()),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ??
                (ThemeController.isDarkTheme
                    ? NeutralColors.grey900
                    : NeutralColors.white),
          ),
          iconColor: MaterialStatePropertyAll(iconColor),
          elevation: const MaterialStatePropertyAll(5),
        ),
        child: icon as Widget,
      ),
    );
  }
}
