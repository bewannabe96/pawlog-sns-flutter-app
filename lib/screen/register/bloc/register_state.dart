import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class InitialRegisterState extends RegisterState {}

class RegisterRequesting extends RegisterState {}

class Registered extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String generalError;
  final String emailError;
  final String nameError;
  final String passwordError;
  final String passwordConfirmError;

  const RegisterFailed({
    this.generalError,
    this.emailError,
    this.nameError,
    this.passwordError,
    this.passwordConfirmError,
  });

  @override
  List<Object> get props => [
        generalError,
        emailError,
        nameError,
        passwordError,
        passwordConfirmError,
      ];
}
