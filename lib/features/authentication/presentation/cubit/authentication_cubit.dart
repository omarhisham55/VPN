import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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

  bool isRegisterButtonDisabled = true;
  bool isLoginButtonDisabled = true;
  bool isSendPasswordOtpButtonDisabled = true;
  bool isSendVerificationOtpButtonDisabled = true;
  bool isRegisterObscure = true;
  bool isLoginObscure = true;
  bool isConfirmObscure = true;
  bool checkboxState = false;
  void setIsRegisterButtonDisabled(String v) {
    name.text.isNotEmpty &&
            email.text.isNotEmpty &&
            password.text.isNotEmpty &&
            confirmPassword.text.isNotEmpty &&
            checkboxState == true
        ? isRegisterButtonDisabled = false
        : isRegisterButtonDisabled = true;

    emit(AuthenticationButtonState(
        isDisabled: 'register: $isRegisterButtonDisabled'));
  }

  void setIsLoginButtonDisabled(String v) {
    email.text.isNotEmpty && password.text.isNotEmpty
        ? isLoginButtonDisabled = false
        : isLoginButtonDisabled = true;
    emit(
        AuthenticationButtonState(isDisabled: 'login: $isLoginButtonDisabled'));
  }

  void setSentPasswordOtpButtonDisabled(String v) {
    v.isNotEmpty
        ? isSendPasswordOtpButtonDisabled = false
        : isSendPasswordOtpButtonDisabled = true;
    emit(AuthenticationButtonState(
        isDisabled: 'otp: $isSendPasswordOtpButtonDisabled'));
  }

  void setSentVerificationOtpButtonDisabled() {
    // ignore: collection_methods_unrelated_type
    otpCode.contains(TextEditingValue.empty)
        ? isSendVerificationOtpButtonDisabled = true
        : isSendVerificationOtpButtonDisabled = false;

    emit(AuthenticationButtonState(
        isDisabled: 'otp: $isSendVerificationOtpButtonDisabled'));
  }

  void togglePassObscure() {
    isRegisterObscure = !isRegisterObscure;
    emit(AuthenticationPasswordState(isRegisterObscure, isConfirmObscure));
  }

  void toggleLoginPassObscure() {
    isLoginObscure = !isLoginObscure;
    emit(AuthenticationPasswordState(isLoginObscure, true));
  }

  void toggleConfirmPassObscure() {
    isConfirmObscure = !isConfirmObscure;
    emit(AuthenticationPasswordState(isRegisterObscure, isConfirmObscure));
  }

  void toggleCheckbox(bool? value) {
    checkboxState = value ?? false;
    setIsRegisterButtonDisabled('');
    emit(AuthenticationCheckboxState(state: checkboxState));
  }
}
