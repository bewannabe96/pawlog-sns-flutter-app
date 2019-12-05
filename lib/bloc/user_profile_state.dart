import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class InitialUserProfileState extends UserProfileState {
  const InitialUserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileLoadingState extends UserProfileState {
  const UserProfileLoadingState();

  @override
  List<Object> get props => [];
}

class UserProfileLoadedState extends UserProfileState {
  final UserProfile profile;
  final List<Story> stories;

  const UserProfileLoadedState({
    @required this.profile,
    @required this.stories,
  });

  @override
  List<Object> get props => [profile];
}

class UserProfileErrorState extends UserProfileState {
  const UserProfileErrorState();

  @override
  List<Object> get props => [];
}
