import 'package:equatable/equatable.dart';

import 'package:pawlog/model/model.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user.userID];

  @override
  String toString() => 'Authenticated [EMAIL: ${user.email}]';
}

class Unauthenticated extends AuthenticationState {}
