import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/features/home/presentation/pages/home_page_manager.dart';
import 'package:vpn_demo/features/home/presentation/pages/paymentPages/payment_page.dart';
import 'package:vpn_demo/features/home/presentation/pages/premiumPages/premium_page.dart';

class HomeRoutes extends AbstractRouters {
  static const String home = '/home';
  static const String premium = '/premium';
  static const String payment = '/payment';

  @override
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        home: (settings) => MaterialPageRoute(
              builder: (context) => const HomePageManager(),
              settings: settings,
            ),
        premium: (settings) => MaterialPageRoute(
              builder: (context) => const PremiumPage(),
              settings: settings,
            ),
        payment: (settings) => MaterialPageRoute(
              builder: (context) => const PaymentPage(),
              settings: settings,
            ),
      };
}
