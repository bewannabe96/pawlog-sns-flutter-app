import 'package:equatable/equatable.dart';

abstract class FamilyEvent extends Equatable {
  const FamilyEvent();
}

class LoadFamilyEvent extends FamilyEvent {
  final int userID;

  const LoadFamilyEvent(this.userID);

  @override
  List<Object> get props => [];
}
