import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class InitialRegisterState extends RegisterState {}

class RegisterProcessingState extends RegisterState {
  const RegisterProcessingState();
}

class RegisterSucceedState extends RegisterState {
  const RegisterSucceedState();
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
}

class VerificationProcessingState extends RegisterState {
  const VerificationProcessingState();
}

class VerificationSucceedState extends RegisterState {
  const VerificationSucceedState();
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
