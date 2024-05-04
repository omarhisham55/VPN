import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/onBoarding/presentation/cubit/onboarding_cubit.dart';
import 'package:vpn_demo/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: OnboardingCubit.get(context).pageViewController,
                    onPageChanged: OnboardingCubit.get(context).onPageChanged,
                    children: OnBoardingStrings.onBoardingStrings.entries
                        .map((e) => PageViewItem(
                              image: e.value[0],
                              title: e.value[1],
                              subtitle: e.value[2],
                            ))
                        .toList(),
                  ),
                ),
                PageViewDotIndicator(
                  currentItem: OnboardingCubit.get(context).currentPage,
                  count: OnBoardingStrings.onBoardingStrings.length,
                  unselectedColor: NeutralColors.grey500,
                  selectedColor: PrimaryColors.primary400,
                ),
                DefualtAppButton(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  text: 'Next',
                  onPressed: () =>
                      OnboardingCubit.get(context).onNextClick(context),
                ),
                TextButton(
                  onPressed: () =>
                      OnboardingCubit.get(context).onSkipClick(context),
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
