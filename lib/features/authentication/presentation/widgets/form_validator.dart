import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            ValueListenableBuilder<bool>(
              valueListenable: auth.isRegisterObscure,
              builder: (context, value, child) {
                return TextFieldLabeled(
                  labelName: 'Password',
                  textField: DefualtTextField(
                    hintText: 'Enter Password',
                    controller: auth.password,
                    keyboardType: TextInputType.text,
                    isObscure: value,
                    onChanged: auth.setIsRegisterButtonDisabled,
                    validator: (v) => v!.isEmpty ? 'required field' : null,
                    suffixIcon: IconButton(
                      onPressed: () => auth.togglePassword(),
                      icon: Icon(
                        value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: auth.isConfirmObscure,
              builder: (context, value, child) {
                return TextFieldLabeled(
                  labelName: 'Confirm Password',
                  textField: DefualtTextField(
                    hintText: 'Enter Confirm Password',
                    controller: auth.confirmPassword,
                    keyboardType: TextInputType.text,
                    onChanged: auth.setIsRegisterButtonDisabled,
                    validator: (v) => v!.isEmpty ? 'required field' : null,
                    isObscure: value,
                    suffixIcon: IconButton(
                      onPressed: () => auth.toggleConfirmPassword(),
                      icon: Icon(
                        value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                );
              },
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
            ValueListenableBuilder<bool>(
              valueListenable: auth.isLoginObscure,
              builder: (context, value, child) {
                return TextFieldLabeled(
                  labelName: 'Password',
                  textField: DefualtTextField(
                    hintText: 'Enter Password',
                    controller: auth.password,
                    keyboardType: TextInputType.text,
                    isObscure: value,
                    onChanged: auth.setIsLoginButtonDisabled,
                    validator: (v) => v!.isEmpty ? 'required field' : null,
                    suffixIcon: IconButton(
                      onPressed: () => auth.toggleLoginPassword(),
                      icon: Icon(
                        value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
