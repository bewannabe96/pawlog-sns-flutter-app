import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
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
}

class ConfirmRegistrationEvent extends RegisterEvent {
  final String email;
  final String verificationCode;

  const ConfirmRegistrationEvent(this.email, this.verificationCode);
}

class ResendConfirmCodeEvent extends RegisterEvent {
  final String email;

  const ResendConfirmCodeEvent(this.email);
}
