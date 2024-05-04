import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/pages/about_app.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/pages/privacy_policy.dart';
import 'package:vpn_demo/features/home/presentation/widgets/settingsWidgets/pages/terms_of_service.dart';

class SettingsRoutes extends AbstractRouters {
  static const String termsOfService = "/termsOfService";
  static const String privacyPolicy = "/privatePolicy";
  static const String aboutApp = "/aboutApp";

  @override
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        termsOfService: (settings) => MaterialPageRoute(
              builder: (context) => const TermsOfService(),
              settings: settings,
            ),
        privacyPolicy: (settings) => MaterialPageRoute(
              builder: (context) => const PrivacyPolicy(),
              settings: settings,
            ),
        aboutApp: (settings) => MaterialPageRoute(
              builder: (context) => const AboutApp(),
              settings: settings,
            ),
      };
}
