import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/dialogs.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class HistoryItem extends StatelessWidget {
  final bool? disableFunction;
  const HistoryItem({super.key, this.disableFunction = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: ThemeController.isDarkTheme
            ? NeutralColors.grey500.withOpacity(0.1)
            : NeutralColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextGlobal(
                  'London - United Kingdom',
                  style: TextSizeState.bodyMedium,
                ),
                SizedBox(height: 12),
                TextGlobal(
                  '12:00 18/03/2024 - 20:00 28/.3/2024',
                  style: TextSizeState.bodySmall,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => disableFunction!
                ? null
                : AppDialogs.deleteHistoryItem(
                    context, const HistoryItem(disableFunction: true)),
            child: const Icon(
              Icons.delete_outline,
              color: NeutralColors.red,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
