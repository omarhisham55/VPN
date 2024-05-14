import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/widgets/premiumWidgets/service_card.dart';
import 'package:vpn_demo/features/home/presentation/widgets/premiumWidgets/subscription_prices.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: extraPageAppbar(
        context,
        'Get Premium',
        backgroundColor: Colors.transparent,
        textColor: NeutralColors.white,
        iconColor: NeutralColors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0, 1],
            colors: [SecondaryColors.secondary500, PrimaryColors.primary500],
          ),
        ),
        child: Column(
          children: [
            const Expanded(child: ServiceCardOffers()),
            const Subscribtion(),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: DefualtAppButton(
                text: 'Get Premium and Enjoyng',
                width: double.infinity,
                onPressed: () =>
                    AppNavigation.push(context, HomeRoutes.payment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
