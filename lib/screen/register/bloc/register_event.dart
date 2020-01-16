import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String name;
  final String password;
  final String passwordConfirm;

  const RegisterSubmitted({
    @required this.email,
    @required this.name,
    @required this.password,
    @required this.passwordConfirm,
  });

  @override
  List<Object> get props => [email, name, password, passwordConfirm];
}
