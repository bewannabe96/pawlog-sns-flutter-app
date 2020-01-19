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

  const UserProfileLoadSuccess({
    @required this.profile,
    @required this.family,
    @required this.stories,
  });

  @override
  List<Object> get props => [profile];
}

class UserProfileLoadFailure extends UserProfileState {}
