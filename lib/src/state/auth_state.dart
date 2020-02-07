import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class AuthState extends Equatable {
  final User user;
  final bool processing;
  final String error;

  bool get isAuthorized => user != null;

  AuthState({
    this.user,
    this.processing = false,
    this.error,
  });

  @override
  List<Object> get props => [user.userID];

  AuthState copyWith({
    User user,
    bool processing,
    String error,
  }) {
    return AuthState(
      user: user ?? this.user,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory AuthState.initialState() => AuthState(
        user: null,
        processing: false,
        error: null,
      );
}
