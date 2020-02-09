import 'package:redux/redux.dart';

import 'package:pawlog/src/state/friend_state.dart';

import 'package:pawlog/src/action/friend_action.dart';

final friendReducer = combineReducers<FriendState>([
  TypedReducer<FriendState, StartLoadingFriendsListAction>(
      _startLoadingFriendsList),
  TypedReducer<FriendState, FinishLoadingFriendsListAction>(
      _finishLoadingFriendsList),
]);

FriendState _startLoadingFriendsList(
    FriendState state, StartLoadingFriendsListAction action) {
  return state.copyWith(
    friendsState: state.friendsState.copyWith(
      processing: true,
    ),
  );
}

FriendState _finishLoadingFriendsList(
    FriendState state, FinishLoadingFriendsListAction action) {
  return state.copyWith(
    friendsState: state.friendsState.copyWith(
      friends: action.friends,
      processing: false,
      error: null,
    ),
  );
}
