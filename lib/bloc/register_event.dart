import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class NewRegisterEvent extends RegisterEvent {
  final String email;
  final String name;
  final String password;
  final String passwordConfirm;

  const NewRegisterEvent(
    this.email,
    this.name,
    this.password,
    this.passwordConfirm,
  );

  @override
  List<Object> get props => [];
}

class ConfirmRegistrationEvent extends RegisterEvent {
  final String email;
  final String verificationCode;

  const ConfirmRegistrationEvent(this.email, this.verificationCode);

  @override
  List<Object> get props => [];
}

class ResendConfirmCodeEvent extends RegisterEvent {
  final String email;

  const ResendConfirmCodeEvent(this.email);

  @override
  List<Object> get props => [];
}
