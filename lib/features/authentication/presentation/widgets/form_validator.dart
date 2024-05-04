import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/core/components/text_fields/text_field_labeled.dart';

class SignUpForm extends StatelessWidget {
  final AuthenticationCubit auth;
  const SignUpForm({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Form(
        key: auth.registerFormKey,
        child: Column(
          children: [
            TextFieldLabeled(
              labelName: 'Full Name',
              textField: DefualtTextField(
                hintText: 'Enter Full Name',
                controller: auth.name,
                keyboardType: TextInputType.name,
                onChanged: auth.setIsRegisterButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
              ),
            ),
            TextFieldLabeled(
              labelName: 'Email',
              textField: DefualtTextField(
                hintText: 'Enter Email',
                controller: auth.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: auth.setIsRegisterButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
              ),
            ),
            TextFieldLabeled(
              labelName: 'Password',
              textField: DefualtTextField(
                hintText: 'Enter Password',
                controller: auth.password,
                keyboardType: TextInputType.text,
                isObscure: auth.isRegisterObscure,
                onChanged: auth.setIsRegisterButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
                suffixIcon: IconButton(
                  onPressed: () => auth.togglePassObscure(),
                  icon: Icon(
                    auth.isRegisterObscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
            TextFieldLabeled(
              labelName: 'Confirm Password',
              textField: DefualtTextField(
                hintText: 'Enter Confirm Password',
                controller: auth.confirmPassword,
                keyboardType: TextInputType.text,
                onChanged: auth.setIsRegisterButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
                isObscure: auth.isConfirmObscure,
                suffixIcon: IconButton(
                  onPressed: () => auth.toggleConfirmPassObscure(),
                  icon: Icon(
                    auth.isConfirmObscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthenticationCubit auth;
  const LoginForm({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Form(
        key: auth.loginFormKey,
        child: Column(
          children: [
            TextFieldLabeled(
              labelName: 'Email',
              textField: DefualtTextField(
                hintText: 'Enter Email',
                controller: auth.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: auth.setIsLoginButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
              ),
            ),
            TextFieldLabeled(
              labelName: 'Password',
              textField: DefualtTextField(
                hintText: 'Enter Password',
                controller: auth.password,
                keyboardType: TextInputType.text,
                isObscure: auth.isLoginObscure,
                onChanged: auth.setIsLoginButtonDisabled,
                validator: (v) => v!.isEmpty ? 'required field' : null,
                suffixIcon: IconButton(
                  onPressed: () => auth.toggleLoginPassObscure(),
                  icon: Icon(
                    auth.isLoginObscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
