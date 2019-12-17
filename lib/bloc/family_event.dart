import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FamilyEvent extends Equatable {
  const FamilyEvent();
}

class CreateFamilyEvent extends FamilyEvent {
  final int userID;

  final String name;

  const CreateFamilyEvent(
    this.userID, {
    @required this.name,
  });

  @override
  List<Object> get props => [];
}

class LoadFamilyEvent extends FamilyEvent {
  final int userID;

  const LoadFamilyEvent(this.userID);

  @override
  List<Object> get props => [];
}
