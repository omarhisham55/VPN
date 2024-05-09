import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: NeutralColors.black,
  appBarTheme: const AppBarTheme(
    color: NeutralColors.black,
    centerTitle: true,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: SecondaryColors.secondary500,
  ),
  iconTheme: const IconThemeData(
    color: NeutralColors.white,
  ),
  checkboxTheme: const CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(NeutralColors.black),
    side: BorderSide(color: NeutralColors.white),
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
    titleMedium: TextStyle(
      color: NeutralColors.white,
    ),
    titleSmall: TextStyle(),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(
      color: NeutralColors.white,
    ),
    bodySmall: TextStyle(),
    labelLarge: TextStyle(),
    labelMedium: TextStyle(),
    labelSmall: TextStyle(),
  ),
  fontFamily: 'Poppins',
);
