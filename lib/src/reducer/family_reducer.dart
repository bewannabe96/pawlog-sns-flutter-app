import 'package:redux/redux.dart';

import 'package:pawlog/src/state/family_state.dart';

import 'package:pawlog/src/action/family_action.dart';

final familyReducer = combineReducers<FamilyState>([
  TypedReducer<FamilyState, StartLoadingFamilyAction>(_startLoadingFamily),
  TypedReducer<FamilyState, UpdateFamilyAction>(_updateFamily),
  TypedReducer<FamilyState, ThrowFamilyErrorAction>(_throwFamilyError),
]);

FamilyState _startLoadingFamily(
    FamilyState state, StartLoadingFamilyAction action) {
  return state.copyWith(processing: true);
}

FamilyState _updateFamily(FamilyState state, UpdateFamilyAction action) {
  return state.copyWith(
    family: action.family,
    processing: false,
    error: null,
  );
}

FamilyState _throwFamilyError(
    FamilyState state, ThrowFamilyErrorAction action) {
  return state.copyWith(
    processing: false,
    error: action.error,
  );
}
