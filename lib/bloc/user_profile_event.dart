import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class LoadUserProfileEvent extends UserProfileEvent {
  final int userID;

  const LoadUserProfileEvent(this.userID);

  @override
  List<Object> get props => [];
}
