import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {
  final String generalError;
  final String emailError;
  final String passwordError;
  final bool userNotConfirmed;

  const LoginFailed({
    this.generalError,
    this.emailError,
    this.passwordError,
    this.userNotConfirmed = false,
  });

  @override
  List<Object> get props => [
        generalError,
        emailError,
        passwordError,
        userNotConfirmed,
      ];
}
