import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class Speedometer extends StatelessWidget {
  const Speedometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: KdGaugeView(
        unitOfMeasurement: 'MB/s',
        minSpeed: 0,
        maxSpeed: 100,
        speed: 100,
        duration: const Duration(seconds: 5),
        animate: true,
        gaugeWidth: 24,
        fractionDigits: 1,
        unitOfMeasurementTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: SecondaryColors.secondary500),
        speedTextStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: SecondaryColors.secondary500, fontWeight: FontWeight.bold),
        alertSpeedArray: const [40, 60, 90],
        alertColorArray: const [
          SecondaryColors.secondary500,
          PrimaryColors.primary500,
          NeutralColors.red,
        ],
      ),
    );
  }
}
