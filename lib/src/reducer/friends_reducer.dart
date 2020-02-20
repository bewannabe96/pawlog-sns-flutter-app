import 'package:redux/redux.dart';

import 'package:pawlog/src/state/friends_state.dart';

import 'package:pawlog/src/action/friend_action.dart';

final friendsReducer = combineReducers<FriendsState>([
  TypedReducer<FriendsState, StartLoadingFriendsAction>(_startLoadingFriends),
  TypedReducer<FriendsState, UpdateFriendsAction>(_updateFriends),
  TypedReducer<FriendsState, ThrowFriendsErrorAction>(_throwFriendsError),
]);

FriendsState _startLoadingFriends(
    FriendsState state, StartLoadingFriendsAction action) {
  return state.copyWith(loading: true);
}

FriendsState _updateFriends(FriendsState state, UpdateFriendsAction action) {
  return state.copyWith(
    friends: action.friends,
    loading: false,
    error: null,
  );
}

FriendsState _throwFriendsError(
    FriendsState state, ThrowFriendsErrorAction action) {
  return state.copyWith(
    loading: false,
    error: action.error,
  );
}
