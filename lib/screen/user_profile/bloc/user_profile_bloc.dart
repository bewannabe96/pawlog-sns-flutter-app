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
      yield* loadProfile(event);
    }
  }

  Stream<UserProfileState> loadProfile(UserProfilePageLoaded event) async* {
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
        print(e);
        yield UserProfileLoadFailure();
      }
    }
  }
}
