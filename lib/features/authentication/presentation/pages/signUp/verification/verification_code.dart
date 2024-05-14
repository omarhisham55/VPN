import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/code_text_field.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/resend_code.dart';

class RegisterVerification extends StatelessWidget {
  const RegisterVerification({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit auth = AuthenticationCubit.get(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextGlobal(
              'Verification',
              style: TextSizeState.displaySmall,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: TextGlobal(
                'Enter the verification code we send you on: email*******@gmail.com',
                style: TextSizeState.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CodeForm(auth: auth),
            const ResendCode(),
            DefualtAppButton(
              text: 'Send OTP',
              isDisabled: auth.isSendVerificationOtpButtonDisabled,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 18, top: 64),
              onPressed: () =>
                  AppNavigation.replaceWith(context, HomeRoutes.home),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextGlobal(
                  'Back to ',
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
