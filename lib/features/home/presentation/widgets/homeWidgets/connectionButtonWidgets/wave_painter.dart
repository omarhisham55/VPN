import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class CircularAudioWave extends StatefulWidget {
  final HomeCubit manager;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  const CircularAudioWave({
    super.key,
    required this.manager,
    this.child,
    this.height = 260,
    this.width = 260,
    this.color,
  });

  @override
  CircularAudioWaveState createState() => CircularAudioWaveState();
}

class CircularAudioWaveState extends State<CircularAudioWave>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.manager.startWaveAnimation(this, mounted);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: List.generate(
            widget.manager.waveCircleSizes.length,
            (index) => CircularWave(
              circleSize: widget.manager.waveCircleSizes[index],
              height: widget.height,
              width: widget.width,
              color: widget.color,
              child: widget.child ?? Container(),
            ),
          ),
        );
      },
    );
  }
}

class CircularWave extends StatelessWidget {
  final double circleSize;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;

  const CircularWave({
    super.key,
    required this.circleSize,
    required this.child,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: HomeCubit.get(context).isConnected
            ? WavePainter(circleSize: circleSize, color: color)
            : null,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: child,
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double circleSize;
  final Color? color;

  WavePainter({required this.circleSize, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = color ?? NeutralColors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final adjustedRadius = circleSize * radius;
    final path = Path()
      ..addOval(
        Rect.fromCircle(center: center, radius: adjustedRadius),
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
