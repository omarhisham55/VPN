part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationButtonState extends AuthenticationState {
  final String isDisabled;

  const AuthenticationButtonState({required this.isDisabled});

  @override
  List<Object> get props => [isDisabled];
}

class AuthenticationCheckboxState extends AuthenticationState {
  final bool state;

  const AuthenticationCheckboxState({required this.state});

  @override
  List<Object> get props => [state];
}

class AuthenticationPasswordState extends AuthenticationState {
  final bool isObscure;
  final bool isConfirmObscure;

  const AuthenticationPasswordState(this.isObscure, this.isConfirmObscure);

  @override
  List<Object> get props => [isObscure, isConfirmObscure];
}
