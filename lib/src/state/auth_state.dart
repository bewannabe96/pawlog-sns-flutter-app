import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class AuthState extends Equatable {
  final String userHash;
  final User user;
  final bool processing;
  final String error;

  bool get isAuthorized => userHash != null && user != null;

  const AuthState._({
    this.userHash,
    this.user,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => [user.userID];

  AuthState copyWith({
    String userHash,
    User user,
    bool processing,
    String error,
  }) {
    return AuthState._(
      userHash: userHash ?? this.userHash,
      user: user ?? this.user,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory AuthState.initialState() => AuthState._(
        userHash: null,
        user: null,
        processing: false,
        error: null,
      );
}
