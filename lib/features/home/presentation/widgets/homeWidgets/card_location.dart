import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(24),
      color: NeutralColors.grey100,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: NeutralColors.grey400,
            ),
            child: const Icon(
              Icons.language_outlined,
              size: 30,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best Location',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: PrimaryColors.primary500),
                ),
                Text(
                  'Fastest Server',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.signal_cellular_alt,
            size: 30,
          ),
        ],
      ),
    );
  }
}
