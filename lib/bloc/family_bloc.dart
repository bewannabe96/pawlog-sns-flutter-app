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
    if (event is CreateFamilyEvent) {
      yield* createFamily(event);
    } else if (event is LoadFamilyEvent) {
      yield* loadFamily(event);
    }
  }

  Stream<FamilyState> createFamily(CreateFamilyEvent event) async* {
    yield FamilyCreatingState();
    try {
      final family =
          await FamilyRepository.createFamily(event.userID, name: event.name);
      yield FamilyLoadedState(family: family);
    } catch (_) {}
  }
}

Stream<FamilyState> loadFamily(LoadFamilyEvent event) async* {
  yield FamilyLoadingState();
  try {
    final family = await FamilyRepository.loadFamily(event.userID);
    yield FamilyLoadedState(family: family);
  } catch (e) {
    yield FamilyErrorState();
  }
}
