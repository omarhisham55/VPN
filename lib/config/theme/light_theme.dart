import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: NeutralColors.grey300,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: SecondaryColors.secondary500,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: PrimaryColors.primary500,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: NeutralColors.white,
    ),
    headlineMedium: TextStyle(),
    headlineSmall: TextStyle(),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
    bodySmall: TextStyle(),
    labelLarge: TextStyle(),
    labelMedium: TextStyle(),
    labelSmall: TextStyle(),
  ),
  fontFamily: 'Poppins',
);
