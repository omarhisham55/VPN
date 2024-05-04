import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppbar(context, 'About App'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset(MainImages.logo2),
            Text(
              'FAST VPN',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: PrimaryColors.primary500),
            ),
            Text(
              'Version 2.1.0',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: PrimaryColors.primary500),
            ),
            const Spacer(),
            Text(
              'www.fastvpn.com',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Copyright 2024',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'All rights reserved',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
