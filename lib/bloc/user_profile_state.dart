import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class InitialUserProfileState extends UserProfileState {
  const InitialUserProfileState();
}

class UserProfileLoadingState extends UserProfileState {
  const UserProfileLoadingState();
}

class UserProfileLoadedState extends UserProfileState {
  final Profile profile;
  final Family family;
  final List<Story> stories;

  const UserProfileLoadedState({
    @required this.profile,
    @required this.family,
    @required this.stories,
  });

  @override
  List<Object> get props => [profile];
}

class UserProfileErrorState extends UserProfileState {
  const UserProfileErrorState();
}
