import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class ConnectedInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ConnectedInfoItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SecondaryColors.secondary500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: NeutralColors.white,
          ),
          const SizedBox(width: 12),
          TextGlobal(
            text,
            color: NeutralColors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
