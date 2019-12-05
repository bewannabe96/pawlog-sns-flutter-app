import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class InitialProfileState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();

  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final Profile profile;

  const ProfileLoadedState({
    @required this.profile,
  }) : assert(profile != null);

  @override
  List<Object> get props => [];
}

class ProfileErrorState extends ProfileState {
  const ProfileErrorState();

  @override
  List<Object> get props => [];
}
