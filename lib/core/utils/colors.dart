import 'package:flutter/material.dart';

class PrimaryColors {
  static const Color primary100 = Color(0xFFFFEBCC);
  static const Color primary200 = Color(0xFFFFD699);
  static const Color primary300 = Color(0xFFFFC266);
  static const Color primary400 = Color(0xFFFFAD33);
  static const Color primary500 = Color(0xFFFF9900);
  static const Color primary600 = Color(0xFFC2780A);
  static const Color primary700 = Color(0xFF8A590F);
  static const Color primary800 = Color(0xFF573A0F);
  static const Color primary900 = Color(0xFF291C0A);
}

class SecondaryColors {
  static const Color secondary100 = Color(0xFFFFF4CC);
  static const Color secondary200 = Color(0xFFFFE999);
  static const Color secondary300 = Color(0xFFFFDD66);
  static const Color secondary400 = Color(0xFFFFD233);
  static const Color secondary500 = Color(0xFFFFC700);
  static const Color secondary600 = Color(0xFFC2990A);
  static const Color secondary700 = Color(0xFF8A6F0F);
  static const Color secondary800 = Color(0xFF57470F);
  static const Color secondary900 = Color(0xFF29220A);
}

class NeutralColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF292929);
  static const Color lightBlack = Color(0xFF424242);
  static const Color red = Color(0xFFFF6347);
  static const Color lightGreen = Color(0xFFDAF8E6);
  static const Color green = Color(0xFF22AD5C);
  static const Color darkGreen = Color(0xFF294736);
  static const Color grey100 = Color(0xFFFAF8F5);
  static const Color grey200 = Color(0xFFF5F3F1);
  static const Color grey300 = Color(0xFFf2EEE9);
  static const Color grey400 = Color(0xFFE7E2DA);
  static const Color grey500 = Color(0xFFDBD6CE);
  static const Color grey600 = Color(0xFFD0CBC3);
  static const Color grey700 = Color(0xFFBAB6B0);
  static const Color grey800 = Color(0xFF9C9891);
  static const Color grey900 = Color(0xFF6D6C69);
}

class GradientColors {
  static const Gradient linearPrimaryGradient = LinearGradient(
    colors: [SecondaryColors.secondary500, PrimaryColors.primary500],
    stops: [0, 1],
  );
  static const Gradient linearPrimaryGradientInverted = LinearGradient(
    colors: [PrimaryColors.primary500, SecondaryColors.secondary500],
    stops: [0, 1],
  );
}
