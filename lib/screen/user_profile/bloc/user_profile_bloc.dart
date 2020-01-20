import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AuthenticationBloc _authenticationBloc;

  UserProfileBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  UserProfileState get initialState => UserProfileIntial();

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is UserProfilePageLoaded) {
      yield* _mapUserProfilePageLoadedToState(event);
    } else if (event is UserFollowStatusChanged) {
      yield* _mapUserFollowStatusChangedToState(event);
    }
  }

  Stream<UserProfileState> _mapUserProfilePageLoadedToState(
    UserProfilePageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      try {
        yield UserProfileLoadProgress();
        final profile = await UserRepository.fetchUserProfile(
          event.userID,
          authState.user.userID,
        );
        final family = await FamilyRepository.loadFamily(event.userID);
        final stories = await UserRepository.fetchUserStories(
          event.userID,
          authState.user.userID,
        );

        yield UserProfileLoadSuccess(
          profile: profile,
          family: family,
          stories: stories,
        );
      } catch (e) {
        yield UserProfileLoadFailure();
      }
    }
  }

  Stream<UserProfileState> _mapUserFollowStatusChangedToState(
    UserFollowStatusChanged event,
  ) async* {
    final currentState = state;

    if (currentState is UserProfileLoadSuccess) {
      final profile = currentState.profile.copyWith(
        followers: event.follow
            ? currentState.profile.followers + 1
            : currentState.profile.followers - 1,
        isFollowing: event.follow ? 1 : -1,
      );

      yield currentState.copyWith(profile: profile);
    }
  }
}
