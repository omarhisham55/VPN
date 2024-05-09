import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/form_validator.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/or_divider.dart';
import 'package:vpn_demo/features/authentication/presentation/widgets/socials_row.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit auth = AuthenticationCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SignUpForm(auth: auth),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: auth.checkboxState,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        activeColor: PrimaryColors.primary500,
                        onChanged: auth.toggleCheckbox,
                      );
                    },
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          'I Agree with ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Terms of Service ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: PrimaryColors.primary400),
                        ),
                        Text(
                          'and ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: PrimaryColors.primary400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DefualtAppButton(
                text: 'Register',
                isDisabled: auth.isRegisterButtonDisabled,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 18, top: 64),
                onPressed: () => auth.onSignUpPress(context),
              ),
              const OrDivider(text: 'Or sign up with'),
              const Socials(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () => AppNavigation.push(
                      context,
                      AuthenticationRoutes.signIn,
                    ),
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: PrimaryColors.primary400,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
