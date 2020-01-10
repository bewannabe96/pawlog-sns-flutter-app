import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FamilyEvent extends Equatable {
  const FamilyEvent();

  @override
  List<Object> get props => [];
}

class CreateFamilyEvent extends FamilyEvent {
  final int userID;

  final String name;

  const CreateFamilyEvent(
    this.userID, {
    @required this.name,
  });
}

class LoadFamilyEvent extends FamilyEvent {
  final int userID;

  const LoadFamilyEvent(this.userID);
}

class RegisterPetEvent extends FamilyEvent {
  final int userID;
  final String name;
  final int breedID;

  const RegisterPetEvent(
    this.userID, {
    @required this.name,
    @required this.breedID,
  });
}
