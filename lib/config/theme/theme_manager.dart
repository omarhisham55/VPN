import 'package:flutter/material.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_theme_func.dart';
import 'package:vpn_demo/config/theme/dark_theme.dart';
import 'package:vpn_demo/config/theme/light_theme.dart';

class ThemeController {
  static bool isDarkTheme =
      DependencyInjection.getIt<SharedPrefsThemeFunc>().getThemeMode();
  static ThemeData mainTheme = isDarkTheme ? darkTheme : lightTheme;

  static void saveTheme(bool value) {
    DependencyInjection.getIt<SharedPrefsThemeFunc>().setThemeMode(value);
    isDarkTheme =
        DependencyInjection.getIt<SharedPrefsThemeFunc>().getThemeMode();
    mainTheme = isDarkTheme ? darkTheme : lightTheme;
  }

  static void getTheme() =>
      DependencyInjection.getIt<SharedPrefsThemeFunc>().getThemeMode();
}
