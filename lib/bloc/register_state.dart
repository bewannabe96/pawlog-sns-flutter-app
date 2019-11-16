import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterProcessingState extends RegisterState {
  const RegisterProcessingState();

  @override
  List<Object> get props => [];
}

enum RegisterErrorTypes {
  EmailError,
  NameError,
  PasswordError,
  PasswordConfirmError,
  Unknown,
}

class RegisterErrorState extends RegisterState {
  final RegisterErrorTypes type;
  final String message;

  const RegisterErrorState(this.type, this.message);

  @override
  List<Object> get props => [type];
}

enum VerificationErrorTypes {
  EmptyCode,
  MismatchCode,
  Unknown,
}

class VerificationErrorState extends RegisterState {
  final VerificationErrorTypes type;

  const VerificationErrorState(this.type);

  @override
  List<Object> get props => [type];
}
