import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class InitialProfileState extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;
  final Family family;
  final List<Story> stories;

  const ProfileLoaded({
    @required this.profile,
    @required this.family,
    @required this.stories,
  })  : assert(profile != null),
        assert(stories != null);
}

class ProfileLoadingError extends ProfileState {}
