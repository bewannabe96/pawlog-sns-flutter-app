import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class UnauthorizedState extends AuthState {
  const UnauthorizedState();

  @override
  List<Object> get props => [];
}

class AuthorizedState extends AuthState {
  final User user;

  const AuthorizedState({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user.hash];
}

class SignInProcessingState extends AuthState {
  const SignInProcessingState();

  @override
  List<Object> get props => [];
}

enum SignInErrorTypes {
  EmptyEmail,
  EmptyPassword,
  UserNotExist,
  NotAuthorized,
  UserNotConfirmed,
  Unknwon,
}

class SignInErrorState extends UnauthorizedState {
  final SignInErrorTypes type;

  const SignInErrorState(this.type);

  @override
  List<Object> get props => [];
}
