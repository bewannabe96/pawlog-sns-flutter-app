import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

class UserFollowBloc extends Bloc<UserFollowEvent, UserFollowState> {
  final AuthenticationBloc _authenticationBloc;

  UserFollowBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  UserFollowState get initialState => UserFollowInitial();

  @override
  Stream<UserFollowState> mapEventToState(
    UserFollowEvent event,
  ) async* {
    if (event is UserFollowRequested) {
      yield* _mapUserFollowRequestedToState(event);
    }
  }

  Stream<UserFollowState> _mapUserFollowRequestedToState(
    UserFollowRequested event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      try {
        yield UserFollowActionProgress();

        final friend = await UserRepository.followUser(
          authState.user.userID,
          event.targetUserID,
          event.follow,
        );

        yield UserFollowActionSuccess(
          follow: event.follow,
          friend: friend,
        );
      } catch (_) {
        yield UserFollowActionFailure();
      }
    }
  }
}
