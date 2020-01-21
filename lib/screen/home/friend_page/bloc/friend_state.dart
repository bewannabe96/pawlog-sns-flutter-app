import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FriendState extends Equatable {
  const FriendState();

  @override
  List<Object> get props => [];
}

class FriendsLoadProgress extends FriendState {}

class FriendsLoadSuccess extends FriendState {
  final List<Friend> friends;

  const FriendsLoadSuccess({
    @required this.friends,
  });
}

class FriendsLoadFailure extends FriendState {}
