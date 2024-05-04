import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppSnackBars {
  static showSnackBar(BuildContext context, String text, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(
      text,
      type: type,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      duration: const Duration(seconds: 2),
      mobilePositionSettings: const MobilePositionSettings(topOnAppearance: 20),
    ).show(context);
  }
}
