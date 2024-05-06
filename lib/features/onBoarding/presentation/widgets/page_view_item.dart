import 'package:flutter/material.dart';
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
                return const Text('img error');
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: PrimaryColors.primary500),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: PrimaryColors.primary400),
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
