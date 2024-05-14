import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/rounded_appbar_button.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';

class AboutUsWidgets {
  static Scaffold aboutUs(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(
        context: context,
        title: 'About Us',
        action: RoundedAppbarButton(
          icon: const Icon(
            Icons.info_outline,
            color: PrimaryColors.primary500,
          ),
          onTap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                const TextGlobal(
                  'We provide many services on many platforms.',
                  textAlign: TextAlign.center,
                  color: PrimaryColors.primary400,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 28),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(
                    AboutImages.aboutImgs.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: NeutralColors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Image.asset(AboutImages.aboutImgs[index]),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              child: IconButton.filled(
                onPressed: () {},
                iconSize: 30,
                padding: const EdgeInsets.all(12),
                icon: const Icon(Icons.mail_outline),
              ),
            ),
            IconButton.filled(
              onPressed: () {},
              iconSize: 30,
              padding: const EdgeInsets.all(12),
              icon: const Icon(Icons.call_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
