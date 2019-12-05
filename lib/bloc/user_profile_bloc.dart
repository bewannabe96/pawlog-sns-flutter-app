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
      yield* loadProfile(event.userID);
    }
  }

  Stream<UserProfileState> loadProfile(int userID) async* {
    yield UserProfileLoadingState();
    try {
      final profile = await ProfileRepository.fetchUserProfile(userID);
      final stories = await ProfileRepository.fetchUserStories(userID);

      yield UserProfileLoadedState(
        profile: profile,
        stories: stories,
      );
    } catch (_) {
      yield UserProfileErrorState();
    }
  }
}
