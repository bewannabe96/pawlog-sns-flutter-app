import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FriendState extends Equatable {
  const FriendState();

  @override
  List<Object> get props => [];
}

class InitialFriendState extends FriendState {}

class FriendsLoading extends FriendState {}

class FriendsLoaded extends FriendState {
  final List<Friend> friends;

  const FriendsLoaded({
    @required this.friends,
  });
}

class FriendsLoadingError extends FriendState {}
