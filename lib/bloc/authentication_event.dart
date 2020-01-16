import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String hash;

  const LoggedIn({@required this.hash}) : assert(hash != null);

  @override
  List<Object> get props => [hash];

  @override
  String toString() => 'LoggedIn [HASH: $hash]';
}
