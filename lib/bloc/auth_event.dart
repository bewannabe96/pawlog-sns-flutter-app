import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  const CheckAuthenticationEvent();
}

class AuthenticateEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthenticateEvent(this.email, this.password);
}
