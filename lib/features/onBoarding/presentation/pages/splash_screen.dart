import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart';
import 'package:vpn_demo/config/network/network_controller/network_controller_cubit.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/routes/onboarding_routes.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_auth_func.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_onboarding_func.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/core/utils/strings.dart';

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
    super.initState();
    _startSlpash();
    NetworkController().checkConnection();
    NetworkController().trackConnectivityChange();
  }

  void _startSlpash() {
    _timer = Timer(const Duration(seconds: 3), onSplashFinish);
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(_animController);
    _slide = Tween<Offset>(begin: const Offset(0, 0.1), end: const Offset(0, 0))
        .animate(_animController);
    _animController.forward();
  }

  void onSplashFinish() {
    DependencyInjection.getIt<SharedPrefsOnboardingFunc>().getOnboardingDone()
        ? DependencyInjection.getIt<SharedPrefsAuthFunc>().getUserLogin()
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
                            return const TextGlobal('img error');
                          },
                        ),
                      ),
                      const TextGlobal(
                        OnBoardingStrings.startTitle,
                        style: TextSizeState.headlineLarge,
                      ),
                      const Expanded(
                        child: TextGlobal(
                          OnBoardingStrings.version,
                          color: NeutralColors.white,
                        ),
                      ),
                      const TextGlobal(
                        OnBoardingStrings.startQuote,
                        textAlign: TextAlign.center,
                        color: NeutralColors.white,
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
