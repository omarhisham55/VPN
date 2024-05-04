import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class DefualtAppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool? isDisabled;
  const DefualtAppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled,
    this.width,
    this.borderRadius = 25,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: MaterialButton(
        minWidth: width,
        height: 48,
        color: PrimaryColors.primary500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: isDisabled ?? false ? null : onPressed,
        disabledColor: NeutralColors.grey500,
        disabledTextColor: NeutralColors.white,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: NeutralColors.white),
        ),
      ),
    );
  }
}
