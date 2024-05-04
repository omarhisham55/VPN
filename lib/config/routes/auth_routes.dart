import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/features/authentication/presentation/pages/forgotPassword/forgot_password.dart';
import 'package:vpn_demo/features/authentication/presentation/pages/login/login.dart';
import 'package:vpn_demo/features/authentication/presentation/pages/signUp/sign_up.dart';
import 'package:vpn_demo/features/authentication/presentation/pages/signUp/verification/verification_code.dart';

class AuthenticationRoutes extends AbstractRouters {
  static const String signUp = "/signup";
  static const String verification = "/verification";
  static const String signIn = "/signIn";
  static const String forgetPassword = "/forgetPassword";

  @override
  Map<String, Route Function(RouteSettings settings)> get allRoutes => {
        signUp: (settings) => MaterialPageRoute(
              builder: (context) => const SignUp(),
              settings: settings,
            ),
        verification: (settings) => MaterialPageRoute(
              builder: (context) => const RegisterVerification(),
              settings: settings,
            ),
        signIn: (settings) => MaterialPageRoute(
              builder: (context) => const Login(),
              settings: settings,
            ),
        forgetPassword: (settings) => MaterialPageRoute(
              builder: (context) => const ForgotPassword(),
              settings: settings,
            ),
      };
}
