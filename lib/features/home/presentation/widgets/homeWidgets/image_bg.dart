import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/images.dart';

class ImageBg extends StatelessWidget {
  const ImageBg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Image.asset(
        MainImages.worldBg,
        fit: BoxFit.cover,
      ),
    );
  }
}
