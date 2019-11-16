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
      yield* loadProfile(event.userID);
    }
  }

  Stream<ProfileState> loadProfile(int userID) async* {
    yield ProfileLoadingState();
    try {
      final profile = await ProfileRepository.fetchUserProfile(userID);
      yield ProfileLoadedState(profile: profile);
    } catch (_) {}
  }
}
