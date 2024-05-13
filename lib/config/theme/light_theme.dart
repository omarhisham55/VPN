import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: NeutralColors.grey300,
  appBarTheme: const AppBarTheme(
    backgroundColor: NeutralColors.grey100,
    centerTitle: true,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: SecondaryColors.secondary500,
  ),
  iconTheme: const IconThemeData(
    color: NeutralColors.black,
  ),
  checkboxTheme: const CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(NeutralColors.white),
    side: BorderSide(color: NeutralColors.black),
  ),
  dialogBackgroundColor: NeutralColors.white,
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
    titleLarge: TextStyle(
      color: NeutralColors.black,
    ),
    titleMedium: TextStyle(
      color: NeutralColors.black,
    ),
    titleSmall: TextStyle(),
    bodyLarge: TextStyle(
      color: NeutralColors.black,
    ),
    bodyMedium: TextStyle(
      color: NeutralColors.black,
    ),
    bodySmall: TextStyle(
      color: NeutralColors.grey800,
    ),
    labelLarge: TextStyle(),
    labelMedium: TextStyle(),
    labelSmall: TextStyle(),
  ),
  fontFamily: 'Poppins',
);
