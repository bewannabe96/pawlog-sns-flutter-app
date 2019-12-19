import 'package:equatable/equatable.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();
}

class LoadFriendsEvent extends FriendEvent {
  final int userID;

  const LoadFriendsEvent(this.userID);

  @override
  List<Object> get props => [];
}