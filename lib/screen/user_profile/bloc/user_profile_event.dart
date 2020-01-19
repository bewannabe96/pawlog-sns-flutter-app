import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class UserProfilePageLoaded extends UserProfileEvent {
  final int userID;

  const UserProfilePageLoaded(this.userID);
}
