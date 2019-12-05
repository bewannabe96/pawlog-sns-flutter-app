import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {
  @override
  FamilyState get initialState => InitialFamilyState();

  @override
  Stream<FamilyState> mapEventToState(
    FamilyEvent event,
  ) async* {
    if (event is LoadFamilyEvent) {
      yield* loadFamily(event.userID);
    }
  }

  Stream<FamilyState> loadFamily(int userID) async* {
    yield FamilyLoadingState();
    try {
      final family = await UserRepository.fetchFamily(userID);
      yield FamilyLoadedState(family: family);
    } catch (_) {
      yield FamilyErrorState();
    }
  }
}
