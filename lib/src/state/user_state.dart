import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class UserState extends Equatable {
  final _ProfileState profileState;
  final _FamilyState familyState;

  UserState._({
    this.profileState,
    this.familyState,
  });

  @override
  List<Object> get props => [profileState, familyState];

  UserState copyWith({
    _ProfileState profileState,
    _FamilyState familyState,
  }) {
    return UserState._(
      profileState: profileState ?? this.profileState,
      familyState: familyState ?? this.familyState,
    );
  }

  factory UserState.initialState() => UserState._(
        profileState: _ProfileState.initialState(),
        familyState: _FamilyState.initialState(),
      );
}

class _ProfileState extends Equatable {
  final Profile profile;
  final bool processing;
  final String error;

  const _ProfileState._({
    this.profile,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => [profile];

  _ProfileState copyWith({
    Profile profile,
    bool processing,
    String error,
  }) {
    return _ProfileState._(
      profile: profile ?? this.profile,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory _ProfileState.initialState() => _ProfileState._(
        profile: null,
        processing: false,
        error: null,
      );
}

class _FamilyState extends Equatable {
  final Family family;
  final bool processing;
  final String error;

  const _FamilyState._({
    this.family,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => [family];

  _FamilyState copyWith({
    Family family,
    bool processing,
    String error,
  }) {
    return _FamilyState._(
      family: family ?? this.family,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory _FamilyState.initialState() => _FamilyState._(
        family: null,
        processing: false,
        error: null,
      );
}
