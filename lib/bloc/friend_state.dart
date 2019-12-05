import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FriendState extends Equatable {
  const FriendState();
}

class InitialFriendState extends FriendState {
  @override
  List<Object> get props => [];
}

class FriendsLoadingState extends FriendState {
  const FriendsLoadingState();

  @override
  List<Object> get props => [];
}

class FriendsLoadedState extends FriendState {
  final List<Friend> friends;

  const FriendsLoadedState({
    @required this.friends,
  });

  @override
  List<Object> get props => [];
}

class FriendErrorState extends FriendState {
  const FriendErrorState();

  @override
  List<Object> get props => [];
}
