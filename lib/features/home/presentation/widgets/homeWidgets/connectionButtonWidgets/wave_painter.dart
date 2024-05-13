import 'dart:async';
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
  static startWaveAnimation() => CircularAudioWaveState().startWaveAnimation();
}

class CircularAudioWaveState extends State<CircularAudioWave>
    with TickerProviderStateMixin {
  List<AnimationController> waveAnimationControllers = [];
  List<Animation<double>> waveAnimations = [];
  List<double> waveCircleSizes = [];

  @override
  void initState() {
    super.initState();
    startWaveAnimation();
  }

  void startWaveAnimation() {
    void animateCircle(int index) {
      if (mounted) {
        late final AnimationController animationController;
        animationController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 3000),
        )..addStatusListener((status) {
            if (!widget.manager.isConnected) {
              setState(() {});
              waveCircleSizes[index] = 0;
              animationController.stop();
            }
            if (status == AnimationStatus.completed) {
              if (index == 5) {
                setState(() {});
                Future.delayed(const Duration(seconds: 1), () {
                  waveCircleSizes[index] = 0;
                });
              } else {
                animationController.repeat();
              }
            }
          });

        late final Animation<double> animation;
        animation = Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {});
            waveCircleSizes[index] = animation.value;
          });

        waveAnimationControllers.add(animationController);
        waveAnimations.add(animation);

        animationController.forward();
      }
    }

    for (int i = 0; i < 5; i++) {
      Timer(Duration(milliseconds: 600 * i), () {
        waveCircleSizes.add(0);
        animateCircle(i);
      });
    }
  }

  @override
  void dispose() {
    for (var controller in waveAnimationControllers) {
      controller.stop();
      controller.removeStatusListener((status) {});
    }
    for (var controller in waveAnimations) {
      controller.removeStatusListener((status) {});
    }
    waveCircleSizes = [];

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: List.generate(
            waveCircleSizes.length,
            (index) => CircularWave(
              circleSize: waveCircleSizes[index],
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
