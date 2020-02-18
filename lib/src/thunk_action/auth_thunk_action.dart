import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/auth_action.dart';

import 'package:pawlog/src/repository/auth_repository.dart';
import 'package:pawlog/src/repository/user_repository.dart';

import 'package:pawlog/src/thunk_action/user_thunk_action.dart';
import 'package:pawlog/src/thunk_action/friend_thunk_action.dart';
import 'package:pawlog/src/thunk_action/story_thunk_action.dart';

ThunkAction<AppState> authenticateUser(String email, String password) {
  return (Store<AppState> store) async {
    store.dispatch(StartAuthenticationAction());

    try {
      final userHash = await AuthRepository.authenticate(email, password);
      final user = await UserRepository.fetchUserInfo(userHash);
      store.dispatch(FinishAuthenticationAction(userHash, user));

      store.dispatch(loadFamily());
      store.dispatch(loadProfile());
      store.dispatch(loadFriends());
      store.dispatch(loadFeedStories());
      store.dispatch(loadNextUserStories());
    } catch (e) {
      print(e);
    }
  };
}
