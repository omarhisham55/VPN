import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class RunSpeedTest extends StatelessWidget {
  const RunSpeedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit manager = HomeCubit.get(context);
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: NeutralColors.grey600,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => !manager.isSpeedometer
                        ? manager.toggleSpeedTest()
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            manager.isSpeedometer ? NeutralColors.white : null,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.radar),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => manager.isSpeedometer
                        ? manager.toggleSpeedTest()
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            !manager.isSpeedometer ? NeutralColors.white : null,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.stacked_line_chart),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: Text(
                'Your IP : 51.77.108.159',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: PrimaryColors.primary500),
              ),
            ),
            DefualtAppButton(
              text: 'Run Speed Test',
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        );
      },
    );
  }
}
