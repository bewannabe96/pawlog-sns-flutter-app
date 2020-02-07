import 'package:redux/redux.dart';

import 'package:pawlog/src/state/auth_state.dart';

import 'package:pawlog/src/action/auth_action.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AuthenticationStartAction>(_startAuthentication),
  TypedReducer<AuthState, AuthenticationFinishAction>(_finishAuthentication),
]);

AuthState _startAuthentication(
    AuthState state, AuthenticationStartAction action) {
  return state.copyWith(processing: true);
}

AuthState _finishAuthentication(
    AuthState state, AuthenticationFinishAction action) {
  return state.copyWith(processing: false);
}
