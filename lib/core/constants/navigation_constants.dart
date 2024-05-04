import 'package:flutter/material.dart';

class AppNavigation {
  static replaceWith(BuildContext context, String route) =>
      Navigator.pushReplacementNamed(context, route);

  static removeAllAndPush(
    BuildContext context,
    String route, {
    String? finalRoute,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        (route) =>
            finalRoute != null ? (route.settings.name == finalRoute) : false,
      );

  static push(BuildContext context, String route) =>
      Navigator.pushNamed(context, route);

  static pop(BuildContext context) => Navigator.pop(context);
}
