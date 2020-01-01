import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  @override
  UserProfileState get initialState => InitialUserProfileState();

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is LoadUserProfileEvent) {
      yield* loadProfile(event);
    }
  }

  Stream<UserProfileState> loadProfile(LoadUserProfileEvent event) async* {
    yield UserProfileLoadingState();
    try {
      final profile = await UserRepository.fetchUserProfile(event.userID);
      final stories = await UserRepository.fetchUserStories(event.userID);

      yield UserProfileLoadedState(
        profile: profile,
        stories: stories,
      );
    } catch (_) {
      yield UserProfileErrorState();
    }
  }
}
