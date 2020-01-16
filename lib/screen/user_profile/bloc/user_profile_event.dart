import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfileEvent extends UserProfileEvent {
  final int userID;

  const LoadUserProfileEvent(this.userID);
}
