import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/form_validator.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/or_divider.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/socials_row.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit auth = AuthenticationCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: NeutralColors.grey100,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextGlobal(
              'Sign In',
              style: TextSizeState.displaySmall,
            ),
            LoginForm(auth: auth),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => AppNavigation.push(
                        context, AuthenticationRoutes.forgetPassword),
                    child: const TextGlobal(
                      'Forgot Password?',
                      color: PrimaryColors.primary500,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            DefualtAppButton(
              text: 'Sign In',
              isDisabled: auth.isLoginButtonDisabled,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 18, top: 64),
              onPressed: () => auth.onLoginPress(context),
            ),
            const OrDivider(text: 'Or sign up with'),
            const Socials(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextGlobal(
                  'Dont\'t have an account? ',
                  style: TextSizeState.bodyMedium,
                ),
                GestureDetector(
                  onTap: () => AppNavigation.pop(context),
                  child: const TextGlobal(
                    'Sign Up',
                    style: TextSizeState.bodyMedium,
                    color: PrimaryColors.primary400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
