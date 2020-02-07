import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/auth_action.dart';

ThunkAction<AppState> authenticateUser(String email, String password) {
  return (Store<AppState> store) async {
    store.dispatch(AuthenticationStartAction());

    store.dispatch(AuthenticationFinishAction());
  };
}
