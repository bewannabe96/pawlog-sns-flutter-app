import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginProgress extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String generalError;
  final String emailError;
  final String passwordError;
  final bool userNotConfirmed;

  const LoginFailure({
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
