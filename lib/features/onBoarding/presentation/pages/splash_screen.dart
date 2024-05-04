import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/routes/onboarding_routes.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/onBoarding/presentation/cubit/onboarding_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _animController;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), onSplashFinish);
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(_animController);
    _slide = Tween<Offset>(begin: const Offset(0, 0.1), end: const Offset(0, 0))
        .animate(_animController);
    _animController.forward();
    super.initState();
  }

  void onSplashFinish() {
    OnboardingCubit.get(context).onBoardingDoneCheck()
        ? AuthenticationCubit.get(context).isUserLoggedIn()
            ? AppNavigation.replaceWith(context, HomeRoutes.home)
            : AppNavigation.replaceWith(context, AuthenticationRoutes.signUp)
        : AppNavigation.replaceWith(context, OnBoardingRoutes.onBoarding);
  }

  @override
  void dispose() {
    _timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0, 1],
            colors: [SecondaryColors.secondary500, PrimaryColors.primary500],
          ),
        ),
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 300)),
          builder: (context, snapshot) {
            return SlideTransition(
              position: _slide,
              child: FadeTransition(
                opacity: _fade,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Lottie.asset(
                          OnBoardingImages.onBoardingStart,
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('stackTrace: $stackTrace');
                            debugPrint('error: $error');

                            return const Text('img error');
                          },
                        ),
                      ),
                      Text(
                        OnBoardingStrings.startTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const Expanded(
                        child: Text(
                          OnBoardingStrings.version,
                          style: TextStyle(color: NeutralColors.white),
                        ),
                      ),
                      Text(
                        OnBoardingStrings.startQuote,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: NeutralColors.white),
                      ),
                      const SizedBox(height: 16),
                      const LinearProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
