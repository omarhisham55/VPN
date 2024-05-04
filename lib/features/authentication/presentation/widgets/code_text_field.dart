import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';

class CodeForm extends StatelessWidget {
  final AuthenticationCubit auth;
  const CodeForm({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: DefualtTextField(
              hintText: '',
              controller: auth.otpCode[index],
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (value) {
                FocusScope.of(context).nextFocus();
                auth.setSentVerificationOtpButtonDisabled();
              },
            ),
          ),
        ),
      ),
    );
  }
}
