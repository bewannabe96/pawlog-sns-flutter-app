import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckAuthenticationEvent extends AuthEvent {
  const CheckAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthenticateEvent(this.email, this.password);

  @override
  List<Object> get props => [];
}
