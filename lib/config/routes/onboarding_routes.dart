import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/features/onBoarding/presentation/pages/onboarding_screen.dart';
import 'package:vpn_demo/features/onBoarding/presentation/pages/splash_screen.dart';

class OnBoardingRoutes extends AbstractRouters {
  static const String splashScreen = "/";
  static const String onBoarding = "/onBoarding";

  @override
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        splashScreen: (settings) => MaterialPageRoute(
              builder: (context) => const SplashScreen(),
              settings: settings,
            ),
        onBoarding: (settings) => MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
              settings: settings,
            ),
      };
}
