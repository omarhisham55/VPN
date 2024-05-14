import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/core/components/text_fields/text_field_labeled.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit auth = AuthenticationCubit.get(context);
    return Scaffold(
      backgroundColor: NeutralColors.grey100,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextGlobal(
              'Forgot Password',
              style: TextSizeState.displaySmall,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: TextGlobal(
                'Enter your email and we will send OTP code to recover the password',
                style: TextSizeState.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: TextFieldLabeled(
                labelName: 'Email',
                textField: DefualtTextField(
                  hintText: 'Enter Email',
                  controller: auth.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: auth.setSentPasswordOtpButtonDisabled,
                  validator: (v) => v!.isEmpty ? 'required field' : null,
                ),
              ),
            ),
            DefualtAppButton(
              text: 'Send OTP',
              isDisabled: auth.isSendPasswordOtpButtonDisabled,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 18, top: 64),
              onPressed: () {},
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
                    'Sign in',
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
