import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class DefualtAppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final ValueListenable<bool>? isDisabled;
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
    return ValueListenableBuilder(
      valueListenable: isDisabled ?? ValueNotifier<bool>(false),
      builder: (context, value, child) {
        return Padding(
          padding: padding!,
          child: MaterialButton(
            minWidth: width,
            height: 48,
            color: PrimaryColors.primary500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: value ? null : onPressed,
            disabledColor: NeutralColors.grey500,
            disabledTextColor: NeutralColors.white,
            child: TextGlobal(
              text,
              style: TextSizeState.titleMedium,
              color: NeutralColors.white,
            ),
          ),
        );
      },
    );
  }
}
