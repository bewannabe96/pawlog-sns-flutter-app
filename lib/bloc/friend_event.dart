import 'package:equatable/equatable.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

class LoadFriendsEvent extends FriendEvent {
  final int userID;

  const LoadFriendsEvent(this.userID);
}
