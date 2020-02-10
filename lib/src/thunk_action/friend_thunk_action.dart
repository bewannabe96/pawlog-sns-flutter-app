import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/friend_action.dart';

import 'package:pawlog/src/repository/friend_repository.dart';

ThunkAction<AppState> loadFriends() {
  return (Store<AppState> store) async {
    store.dispatch(StartLoadingFriendsListAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }
      final friends = await FriendRepository.fetchFriends(
        store.state.authState.user.userID,
      );
      store.dispatch(FinishLoadingFriendsListAction(friends));
    } catch (e) {
      print(e);
    }
  };
}
