import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UnauthorizedState extends AuthState {
  const UnauthorizedState();
}

class AuthorizedState extends AuthState {
  final String userHash;
  final User user;

  const AuthorizedState({
    @required this.userHash,
    @required this.user,
  })  : assert(userHash != null),
        assert(user != null);

  @override
  List<Object> get props => [userHash];
}

class SignInProcessingState extends AuthState {
  const SignInProcessingState();
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
}
