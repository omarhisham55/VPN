import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class PanelHeader extends StatelessWidget {
  const PanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: NeutralColors.grey700,
          ),
        ),
      ],
    );
  }
}
