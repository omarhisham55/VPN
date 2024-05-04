import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/speedTestWidgets/speedMeasuresWidgets/chart.dart';
import 'package:vpn_demo/features/home/presentation/widgets/speedTestWidgets/speedMeasuresWidgets/run_speed_test.dart';
import 'package:vpn_demo/features/home/presentation/widgets/speedTestWidgets/speedMeasuresWidgets/speedometer.dart';

class SpeedMeasure extends StatelessWidget {
  const SpeedMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            return Expanded(
              child: ConditionalBuilder(
                condition: HomeCubit.get(context).isSpeedometer,
                builder: (context) => const Speedometer(),
                fallback: (context) => const ChartMeasure(),
              ),
            );
          }),
          const RunSpeedTest(),
        ],
      ),
    );
  }
}
