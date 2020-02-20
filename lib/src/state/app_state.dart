import 'package:equatable/equatable.dart';

import 'package:pawlog/src/state/auth_state.dart';

import 'package:pawlog/src/state/friends_state.dart';
import 'package:pawlog/src/state/family_state.dart';

import 'package:pawlog/src/state/feed_state.dart';
import 'package:pawlog/src/state/user_stories_state.dart';
import 'package:pawlog/src/state/story_detail_state.dart';

class AppState extends Equatable {
  final AuthState authState;

  final FriendsState friendsState;
  final FamilyState familyState;

  // story
  final FeedState feedState;
  final UserStoriesState userStoriesState;
  final StoryDetailState storyDetailState;

  const AppState({
    this.authState,
    this.friendsState,
    this.familyState,
    this.feedState,
    this.userStoriesState,
    this.storyDetailState,
  });

  @override
  List<Object> get props => [
        authState,
        friendsState,
        familyState,
        feedState,
        userStoriesState,
        storyDetailState,
      ];

  factory AppState.initialState() => AppState(
        authState: AuthState.initialState(),
        friendsState: FriendsState.initialState(),
        familyState: FamilyState.initialState(),
        feedState: FeedState.initialState(),
        userStoriesState: UserStoriesState.initialState(),
        storyDetailState: StoryDetailState.initialState(),
      );
}
