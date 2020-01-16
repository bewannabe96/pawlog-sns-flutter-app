import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FamilyEvent extends Equatable {
  const FamilyEvent();

  @override
  List<Object> get props => [];
}

class CreateFamilyEvent extends FamilyEvent {
  final String name;

  const CreateFamilyEvent({
    @required this.name,
  });
}

class LoadFamilyEvent extends FamilyEvent {
  const LoadFamilyEvent();
}

class RegisterPetEvent extends FamilyEvent {
  final String name;
  final int breedID;

  const RegisterPetEvent({
    @required this.name,
    @required this.breedID,
  });
}
