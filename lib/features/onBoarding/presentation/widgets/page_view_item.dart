import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              image,
              errorBuilder: (context, error, stackTrace) {
                return const TextGlobal('img error');
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextGlobal(
                  title,
                  style: TextSizeState.titleMedium,
                  color: PrimaryColors.primary500,
                ),
                TextGlobal(
                  subtitle,
                  style: TextSizeState.bodyLarge,
                  color: PrimaryColors.primary400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
