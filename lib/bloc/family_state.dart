import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FamilyState extends Equatable {
  const FamilyState();
}

class InitialFamilyState extends FamilyState {
  @override
  List<Object> get props => [];
}

class FamilyLoadingState extends FamilyState {
  const FamilyLoadingState();

  @override
  List<Object> get props => [];
}

class FamilyCreatingState extends FamilyLoadingState {
  const FamilyCreatingState();

  @override
  List<Object> get props => [];
}

class PetRegisteringState extends FamilyLoadingState {
  const PetRegisteringState();

  @override
  List<Object> get props => [];
}

class FamilyLoadedState extends FamilyState {
  final Family family;

  const FamilyLoadedState({
    @required this.family,
  });

  @override
  List<Object> get props => [];
}

class FamilyErrorState extends FamilyState {
  const FamilyErrorState();

  @override
  List<Object> get props => [];
}
