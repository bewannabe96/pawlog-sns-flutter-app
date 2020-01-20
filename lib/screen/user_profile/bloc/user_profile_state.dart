import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileIntial extends UserProfileState {}

class UserProfileLoadProgress extends UserProfileState {}

class UserProfileLoadSuccess extends UserProfileState {
  final Profile profile;
  final Family family;
  final List<Story> stories;

  final int stateVersion;

  const UserProfileLoadSuccess({
    @required this.profile,
    @required this.family,
    @required this.stories,
    this.stateVersion = 1,
  });

  @override
  List<Object> get props => [stateVersion];

  UserProfileLoadSuccess copyWith({
    Profile profile,
    Family family,
    List<Story> stories,
  }) {
    return UserProfileLoadSuccess(
      profile: profile ?? this.profile,
      family: family ?? this.family,
      stories: stories ?? this.stories,
      stateVersion: stateVersion + 1,
    );
  }
}

class UserProfileLoadFailure extends UserProfileState {}
