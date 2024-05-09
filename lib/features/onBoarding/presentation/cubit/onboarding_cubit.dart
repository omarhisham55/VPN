import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_onboarding_func.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) =>
      BlocProvider.of<OnboardingCubit>(context);

  final PageController pageViewController = PageController();
  int currentPage = 0;
  void onNextClick(BuildContext context) {
    if (pageViewController.page!.round() != 3) {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onSkipClick(context);
    }
  }

  void onSkipClick(BuildContext context) {
    DependencyInjection.getIt<SharedPrefsOnboardingFunc>().setOnboardingDone();
    AppNavigation.replaceWith(context, AuthenticationRoutes.signUp);
  }

  void onPageChanged(int value) {
    currentPage = value;
    emit(OnboardingPageViewState(currentPage: currentPage));
  }
}
