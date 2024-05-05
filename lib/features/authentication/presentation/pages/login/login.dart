import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_auth_func.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
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
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit auth = AuthenticationCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: NeutralColors.grey100,
          body: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.displaySmall,
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
                        child: Text(
                          'Forgot Password?',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: PrimaryColors.primary500,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                  onPressed: () {
                    SharedPrefsAuthFuncImpl().setUserLogin();
                    AppNavigation.removeAllAndPush(context, HomeRoutes.home);
                  },
                ),
                const OrDivider(text: 'Or sign up with'),
                const Socials(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont\'t have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () => AppNavigation.pop(context),
                      child: Text(
                        'Sign Up',
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
        );
      },
    );
  }
}
