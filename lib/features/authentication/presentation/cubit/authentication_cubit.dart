import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart';
import 'package:vpn_demo/config/routes/auth_routes.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/config/sharedPreferences/functions/shared_prefs_auth_func.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final List<TextEditingController> otpCode =
      List.generate(4, (index) => TextEditingController());

  ValueNotifier<bool> isRegisterButtonDisabled = ValueNotifier<bool>(true);
  ValueNotifier<bool> checkboxState = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSendVerificationOtpButtonDisabled =
      ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoginButtonDisabled = ValueNotifier<bool>(true);
  ValueNotifier<bool> isSendPasswordOtpButtonDisabled =
      ValueNotifier<bool>(true);
  ValueNotifier<bool> isRegisterObscure = ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoginObscure = ValueNotifier<bool>(true);
  ValueNotifier<bool> isConfirmObscure = ValueNotifier<bool>(true);
  void setIsRegisterButtonDisabled(String v) {
    name.text.isNotEmpty &&
            email.text.isNotEmpty &&
            password.text.isNotEmpty &&
            confirmPassword.text.isNotEmpty &&
            checkboxState.value == true
        ? isRegisterButtonDisabled.value = false
        : isRegisterButtonDisabled.value = true;
  }

  void onSignUpPress(BuildContext context) {
    AppNavigation.push(context, AuthenticationRoutes.verification);
  }

  void onLoginPress(BuildContext context) {
    DependencyInjection.getIt<SharedPrefsAuthFunc>().setUserLogin();
    AppNavigation.removeAllAndPush(context, HomeRoutes.home);
  }

  void toggleCheckbox(bool? value) {
    checkboxState.value = value ?? false;
    setIsRegisterButtonDisabled('');
  }

  void setIsLoginButtonDisabled(String v) {
    email.text.isNotEmpty && password.text.isNotEmpty
        ? isLoginButtonDisabled.value = false
        : isLoginButtonDisabled.value = true;
  }

  void setSentPasswordOtpButtonDisabled(String v) {
    v.isNotEmpty
        ? isSendPasswordOtpButtonDisabled.value = false
        : isSendPasswordOtpButtonDisabled.value = true;
  }

  void setSentVerificationOtpButtonDisabled() {
    if (otpCode.every((element) => element.text.isNotEmpty)) {
      isSendVerificationOtpButtonDisabled.value = false;
    } else {
      isSendVerificationOtpButtonDisabled.value = true;
    }
  }

  void togglePassword() {
    isRegisterObscure.value = !isRegisterObscure.value;
  }

  void toggleConfirmPassword() {
    isConfirmObscure.value = !isConfirmObscure.value;
  }

  void toggleLoginPassword() {
    isLoginObscure.value = !isLoginObscure.value;
  }
}
