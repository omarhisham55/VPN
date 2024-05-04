import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class CircleBackground extends StatelessWidget {
  const CircleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CustomPaint(
        size: const Size(double.infinity, 280),
        painter: CirclePainter(),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(-200, 0, size.width + 400, 350);
    const gradient = GradientColors.linearPrimaryGradient;
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
