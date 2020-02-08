import 'package:equatable/equatable.dart';

import 'package:pawlog/src/state/auth_state.dart';
import 'package:pawlog/src/state/friend_state.dart';

class AppState extends Equatable {
  final AuthState authState;
  final FriendState friendState;

  const AppState({
    this.authState,
    this.friendState,
  });

  @override
  List<Object> get props => [authState, friendState];

  factory AppState.initialState() => AppState(
        authState: AuthState.initialState(),
        friendState: FriendState.initialState(),
      );
}
