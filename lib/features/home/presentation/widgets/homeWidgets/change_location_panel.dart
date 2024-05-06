import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/changeLocationWidgets/change_location_free_premium_button.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/changeLocationWidgets/location_item.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/changeLocationWidgets/search_location_search_bar.dart';

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
          ),
          const LocationFreePremiumButton(),
          const SearchBarLoaction(),
          const LocationsList(),
        ],
      ),
    );
  }
}
