import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/repository/repository.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final AuthenticationBloc _authenticationBloc;

  FriendBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FriendState get initialState => InitialFriendState();

  @override
  Stream<FriendState> mapEventToState(
    FriendEvent event,
  ) async* {
    if (event is FriendPageLoaded) {
      yield* _mapFriendPageLoadedToState(event);
    }
  }

  Stream<FriendState> _mapFriendPageLoadedToState(
    FriendPageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield FriendsLoading();
      try {
        final friends = await UserRepository.fetchFriends(
          authState.user.userID,
        );
        yield FriendsLoaded(friends: friends);
      } catch (e) {
        yield FriendsLoadingError();
      }
    }
  }
}
