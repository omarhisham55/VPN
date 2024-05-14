import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(24),
      color: ThemeController.isDarkTheme
          ? NeutralColors.grey700.withOpacity(0.3)
          : NeutralColors.grey100,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: NeutralColors.grey400,
            ),
            child: Icon(
              Icons.language_outlined,
              size: 30,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextGlobal(
                  MainStrings.bestLoction,
                  style: TextSizeState.bodyMedium,
                  color: PrimaryColors.primary500,
                ),
                TextGlobal(
                  MainStrings.fastestServer,
                  style: TextSizeState.bodyMedium,
                ),
              ],
            ),
          ),
          Icon(
            Icons.signal_cellular_alt,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }
}
