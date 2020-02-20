import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/family_action.dart';

import 'package:pawlog/src/repository/user_repository.dart';

ThunkAction<AppState> loadFamily() {
  return (Store<AppState> store) async {
    store.dispatch(StartLoadingFamilyAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }

      final family = await UserRepository.fetchUserFamily(
          store.state.authState.user.userID);

      store.dispatch(UpdateFamilyAction(family));
    } catch (e) {
      store.dispatch(ThrowFamilyErrorAction(e.toString()));
    }
  };
}

ThunkAction<AppState> createFamily(String familyName) {
  return (Store<AppState> store) async {
    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }

      final family = await UserRepository.createFamily(
          store.state.authState.user.userID, familyName);

      store.dispatch(UpdateFamilyAction(family));
    } catch (e) {
      store.dispatch(ThrowFamilyErrorAction(e.toString()));
    }
  };
}
