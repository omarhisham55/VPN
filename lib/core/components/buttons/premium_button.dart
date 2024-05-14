import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class PremiumButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function() onPressed;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool? isDisabled;
  final Color? buttonColor;
  final Color? textColor;
  const PremiumButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isDisabled,
    this.width,
    this.borderRadius = 25,
    this.padding = EdgeInsets.zero,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: MaterialButton(
        minWidth: width,
        height: 48,
        color: buttonColor ?? NeutralColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            TextGlobal(
              text,
              style: TextSizeState.titleMedium,
              color: textColor ?? PrimaryColors.primary500,
            ),
          ],
        ),
      ),
    );
  }
}
