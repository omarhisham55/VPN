import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class ChangeLocationPanel extends StatelessWidget {
  const ChangeLocationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Column(
        children: [
          Text(
            MainStrings.changeLocation,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
