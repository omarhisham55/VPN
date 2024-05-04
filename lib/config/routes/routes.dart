import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/routes/onboarding_routes.dart';
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
      };

  Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            MainStrings.undefinedRoute,
            style: Theme.of(context).textTheme.displayMedium,
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
