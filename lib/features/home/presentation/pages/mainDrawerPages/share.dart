import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/utils/images.dart';

class SharePageWidgets {
  static Scaffold share(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(context: context, title: 'Share'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Image.asset(
                  ShareImages.shareImgs[index],
                  width: 80,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Image.asset(
                  ShareImages.shareImgs[index + 4],
                  width: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
