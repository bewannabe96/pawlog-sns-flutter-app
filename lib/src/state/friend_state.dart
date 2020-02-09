import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class FriendState extends Equatable {
  final _FriendsState friendsState;

  FriendState._({
    this.friendsState,
  });

  @override
  List<Object> get props => [friendsState];

  FriendState copyWith({
    _FriendsState friendsState,
  }) {
    return FriendState._(
      friendsState: friendsState ?? this.friendsState,
    );
  }

  factory FriendState.initialState() => FriendState._(
        friendsState: _FriendsState.initialState(),
      );
}

class _FriendsState extends Equatable {
  final List<Friend> friends;
  final bool processing;
  final String error;

  const _FriendsState._({
    this.friends,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => friends.map((friend) => friend.userID).toList();

  _FriendsState copyWith({
    List<Friend> friends,
    bool processing,
    String error,
  }) {
    return _FriendsState._(
      friends: friends ?? this.friends,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory _FriendsState.initialState() => _FriendsState._(
        friends: const [],
        processing: false,
        error: null,
      );
}
