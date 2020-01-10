import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is LoadProfileEvent) {
      yield* loadProfile(event);
    }
  }

  Stream<ProfileState> loadProfile(LoadProfileEvent event) async* {
    yield ProfileLoadingState();
    try {
      final profile = await UserRepository.fetchUserProfile(event.userID);
      final family = await FamilyRepository.loadFamily(event.userID);
      final stories = await UserRepository.fetchUserStories(event.userID);
      yield ProfileLoadedState(
        profile: profile,
        family: family,
        stories: stories,
      );
    } catch (e) {
      print(e);
      yield ProfileErrorState();
    }
  }
}
