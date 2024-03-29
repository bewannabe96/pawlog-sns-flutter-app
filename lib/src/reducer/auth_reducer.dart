import 'package:redux/redux.dart';

import 'package:pawlog/src/state/auth_state.dart';

import 'package:pawlog/src/action/auth_action.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, StartAuthenticationAction>(_startAuthentication),
  TypedReducer<AuthState, FinishAuthenticationAction>(_finishAuthentication),
  TypedReducer<AuthState, ThrowAuthenticationErrorAction>(
      _throwAuthenticationError),
]);

AuthState _startAuthentication(
    AuthState state, StartAuthenticationAction action) {
  return state.copyWith(processing: true);
}

AuthState _finishAuthentication(
    AuthState state, FinishAuthenticationAction action) {
  return state.copyWith(
    userHash: action.userHash,
    user: action.user,
    processing: false,
    error: null,
  );
}

AuthState _throwAuthenticationError(
    AuthState state, ThrowAuthenticationErrorAction action) {
  return state.copyWith(
    processing: false,
    error: action.error,
  );
}
