import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';

class GrowingCircularContainer extends StatefulWidget {
  final HomeCubit manager;
  const GrowingCircularContainer({
    super.key,
    required this.manager,
  });

  @override
  GrowingCircularContainerState createState() =>
      GrowingCircularContainerState();
}

class GrowingCircularContainerState extends State<GrowingCircularContainer>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    widget.manager.growingCircularContainerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(250, 250),
      painter:
          widget.manager.growingCircularContainerControllerAnimation != null
              ? GrowingCirclePainter(
                  widget.manager.growingCircularContainerControllerAnimation!)
              : null,
    );
  }
}

class GrowingCirclePainter extends CustomPainter {
  final Animation<double> animation;

  GrowingCirclePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final startAngle = animation.value;
    final endAngle = animation.value + 2 * pi;

    final path = Path()..addArc(rect, startAngle, endAngle);

    final paint = Paint()
      ..shader = GradientColors.linearPrimaryGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(GrowingCirclePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
