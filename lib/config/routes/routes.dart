import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/routes/onboarding_routes.dart';
import 'package:vpn_demo/config/routes/settings_routes.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';

abstract class AbstractRouters {
  Map<String, Route Function(RouteSettings settings)> get allRoutes;
}

class Routes {
  Routes._();

  factory Routes() => Routes._();
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        ...OnBoardingRoutes().allRoutes,
        ...AuthenticationRoutes().allRoutes,
        ...HomeRoutes().allRoutes,
        ...SettingsRoutes().allRoutes,
      };

  Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: TextGlobal(
            MainStrings.undefinedRoute,
            style: TextSizeState.displayMedium,
          ),
        ),
      ),
    );
  }
}

class OnGenerateRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    final route = Routes().allRoutes[settings.name];
    if (route != null) return route(settings);
    return Routes().undefinedRoute();
  }
}
