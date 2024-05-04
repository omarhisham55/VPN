import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class DefualtOutlinedAppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  const DefualtOutlinedAppButton({
    super.key,
    required this.text,
    required this.onPressed,
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
        color: NeutralColors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: NeutralColors.grey500),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: PrimaryColors.primary500),
        ),
      ),
    );
  }
}
