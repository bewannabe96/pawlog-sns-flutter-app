import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/repository/repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthenticationBloc _authenticationBloc;

  ProfileBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ProfileState get initialState => ProfileLoadProgress();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfilePageLoaded) {
      yield* _mapProfilePageLoadedToState(event);
    }
  }

  Stream<ProfileState> _mapProfilePageLoadedToState(
    ProfilePageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield ProfileLoadProgress();
      try {
        final profile = await UserRepository.fetchUserProfile(
          authState.user.userID,
          authState.user.userID,
        );
        final family = await FamilyRepository.loadFamily(
          authState.user.userID,
        );
        final stories = await UserRepository.fetchUserStories(
          authState.user.userID,
          authState.user.userID,
        );
        yield ProfileLoadSuccess(
          profile: profile,
          family: family,
          stories: stories,
        );
      } catch (e) {
        yield ProfileLoadFailure();
      }
    }
  }
}