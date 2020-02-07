import 'package:equatable/equatable.dart';

import 'package:pawlog/src/state/auth_state.dart';

class AppState extends Equatable {
  final AuthState authState;

  AppState({
    this.authState,
  });

  @override
  List<Object> get props => [authState];

  factory AppState.initialState() => AppState(
        authState: AuthState.initialState(),
      );
}
