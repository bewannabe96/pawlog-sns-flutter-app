import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class UserProfilePageLoaded extends UserProfileEvent {
  final int userID;

  const UserProfilePageLoaded({@required this.userID});
}

class UserFollowStatusChanged extends UserProfileEvent {
  final bool follow;

  const UserFollowStatusChanged({@required this.follow});
}
