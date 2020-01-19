import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterProgress extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String generalError;
  final String emailError;
  final String nameError;
  final String passwordError;
  final String passwordConfirmError;

  const RegisterFailure({
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
