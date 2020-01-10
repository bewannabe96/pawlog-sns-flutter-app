import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FriendState extends Equatable {
  const FriendState();

  @override
  List<Object> get props => [];
}

class InitialFriendState extends FriendState {}

class FriendsLoadingState extends FriendState {
  const FriendsLoadingState();
}

class FriendsLoadedState extends FriendState {
  final List<Friend> friends;

  const FriendsLoadedState({
    @required this.friends,
  });
}

class FriendErrorState extends FriendState {
  const FriendErrorState();
}
