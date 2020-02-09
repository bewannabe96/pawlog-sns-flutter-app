import 'package:equatable/equatable.dart';

import 'package:pawlog/src/state/auth_state.dart';
import 'package:pawlog/src/state/friend_state.dart';
import 'package:pawlog/src/state/story_state.dart';

class AppState extends Equatable {
  final AuthState authState;
  final FriendState friendState;
  final StoryState storyState;

  const AppState({
    this.authState,
    this.friendState,
    this.storyState,
  });

  @override
  List<Object> get props => [authState, friendState];

  factory AppState.initialState() => AppState(
        authState: AuthState.initialState(),
        friendState: FriendState.initialState(),
        storyState: StoryState.initialState(),
      );
}
