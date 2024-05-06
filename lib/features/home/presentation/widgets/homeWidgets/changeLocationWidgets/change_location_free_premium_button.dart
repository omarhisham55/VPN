import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class LocationFreePremiumButton extends StatefulWidget {
  const LocationFreePremiumButton({super.key});

  @override
  State<LocationFreePremiumButton> createState() =>
      LocationFreePremiumButtonState();
}

class LocationFreePremiumButtonState extends State<LocationFreePremiumButton> {
  bool isFree = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: NeutralColors.grey200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: buttonItem(
              'Free',
              () => setState(() => isFree = true),
              isFree,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buttonItem(
              'Premium',
              () => setState(() => isFree = false),
              !isFree,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonItem(String text, Function() onTap, bool isFree) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isFree ? NeutralColors.white : null,
          borderRadius: BorderRadius.circular(8),
          border: isFree ? Border.all(color: PrimaryColors.primary400) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
