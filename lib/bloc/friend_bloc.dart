import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final AuthenticationBloc _authenticationBloc;

  FriendBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FriendState get initialState => FriendsLoadProgress();

  @override
  Stream<FriendState> mapEventToState(
    FriendEvent event,
  ) async* {
    if (event is FriendPageLoaded) {
      yield* _mapFriendPageLoadedToState(event);
    } else if (event is FriendUpdated) {
      yield* _mapFriendUpdatedToState(event);
    }
  }

  Stream<FriendState> _mapFriendPageLoadedToState(
    FriendPageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield FriendsLoadProgress();
      try {
        final friends = await UserRepository.fetchFriends(
          authState.user.userID,
        );
        yield FriendsLoadSuccess(friends: friends);
      } catch (e) {
        yield FriendsLoadFailure();
      }
    }
  }

  Stream<FriendState> _mapFriendUpdatedToState(
    FriendUpdated event,
  ) async* {
    final currentState = state;

    if (currentState is FriendsLoadSuccess) {
      final friends = currentState.friends;
      event.add ? friends.add(event.friend) : friends.remove(event.friend);
      yield FriendsLoadSuccess(friends: friends);
    }
  }
}
