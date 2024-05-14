import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: extraPageAppbar(context, 'About App'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset(MainImages.logo2),
            const Column(
              children: [
                TextGlobal(
                  'FAST VPN',
                  style: TextSizeState.displayLarge,
                  color: PrimaryColors.primary500,
                ),
                TextGlobal(
                  'Version 2.1.0',
                  style: TextSizeState.headlineMedium,
                  color: PrimaryColors.primary500,
                ),
                Spacer(),
                TextGlobal(
                  'www.fastvpn.com',
                  style: TextSizeState.bodyMedium,
                ),
                TextGlobal(
                  'Copyright 2024',
                  style: TextSizeState.bodySmall,
                ),
                TextGlobal(
                  'All rights reserved',
                  style: TextSizeState.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
