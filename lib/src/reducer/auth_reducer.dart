import 'package:redux/redux.dart';

import 'package:pawlog/src/state/auth_state.dart';
import 'package:pawlog/src/action/auth_action.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SignInAction>(_signIn),
]);

AuthState _signIn(AuthState authState, SignInAction action) {
  return authState.copyWith(isSignedIn: true);
}
