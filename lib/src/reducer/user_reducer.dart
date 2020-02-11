import 'package:redux/redux.dart';

import 'package:pawlog/src/state/user_state.dart';

import 'package:pawlog/src/action/user_action.dart';

final profileReducer = combineReducers<UserState>([
  TypedReducer<UserState, StartLoadingProfileAction>(_startLoadingProfile),
  TypedReducer<UserState, FinishLoadingProfileAction>(_finishLoadingProfile),
  TypedReducer<UserState, StartLoadingFamilyAction>(_startLoadingFamily),
  TypedReducer<UserState, FinishLoadingFamilyAction>(_finishLoadingFamily),
  TypedReducer<UserState, UpdateFamilyAction>(_updateFamily),
]);

UserState _startLoadingProfile(
    UserState state, StartLoadingProfileAction action) {
  return state.copyWith(
    profileState: state.profileState.copyWith(
      loading: true,
    ),
  );
}

UserState _finishLoadingProfile(
    UserState state, FinishLoadingProfileAction action) {
  return state.copyWith(
    profileState: state.profileState.copyWith(
      profile: action.profile,
      loading: false,
      error: null,
    ),
  );
}

UserState _startLoadingFamily(
    UserState state, StartLoadingFamilyAction action) {
  return state.copyWith(
    familyState: state.familyState.copyWith(
      loading: true,
    ),
  );
}

UserState _finishLoadingFamily(
    UserState state, FinishLoadingFamilyAction action) {
  return state.copyWith(
    familyState: state.familyState.copyWith(
      family: action.family,
      loading: false,
      error: null,
    ),
  );
}

UserState _updateFamily(UserState state, UpdateFamilyAction action) {
  return state.copyWith(
    familyState: state.familyState.copyWith(
      family: action.family,
    ),
  );
}
