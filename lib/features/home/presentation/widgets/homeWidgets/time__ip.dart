import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class ShowTimeAndIpAddress extends StatelessWidget {
  const ShowTimeAndIpAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ConditionalBuilder(
              condition: HomeCubit.get(context).isConnected &&
                  HomeCubit.get(context).growingCircularContainerController ==
                      null,
              builder: (context) => const Column(
                children: [
                  TextGlobal(
                    '01 : 25 : 40',
                    style: TextSizeState.displayMedium,
                    color: PrimaryColors.primary500,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 12),
                  TextGlobal(
                    'Your IP : 515.77.108.159',
                    style: TextSizeState.titleMedium,
                    color: PrimaryColors.primary500,
                  ),
                ],
              ),
              fallback: (context) => Container(),
            ),
          ),
        );
      },
    );
  }
}
