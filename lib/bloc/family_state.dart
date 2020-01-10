import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FamilyState extends Equatable {
  const FamilyState();

  @override
  List<Object> get props => [];
}

class InitialFamilyState extends FamilyState {}

class FamilyLoadingState extends FamilyState {
  const FamilyLoadingState();
}

class FamilyCreatingState extends FamilyLoadingState {
  const FamilyCreatingState();
}

class PetRegisteringState extends FamilyLoadingState {
  const PetRegisteringState();
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
}
