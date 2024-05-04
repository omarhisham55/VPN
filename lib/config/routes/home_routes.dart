import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/features/home/presentation/pages/home_page_manager.dart';

class HomeRoutes extends AbstractRouters {
  static const String home = '/home';

  @override
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        home: (settings) => MaterialPageRoute(
              builder: (context) => const HomePageManager(),
              settings: settings,
            ),
      };
}
