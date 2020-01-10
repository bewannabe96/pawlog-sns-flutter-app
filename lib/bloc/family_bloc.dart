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
    } else if (event is RegisterPetEvent) {
      yield* registerPet(event);
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

  Stream<FamilyState> loadFamily(LoadFamilyEvent event) async* {
    yield FamilyLoadingState();
    try {
      final family = await FamilyRepository.loadFamily(event.userID);
      yield FamilyLoadedState(family: family);
    } catch (e) {
      yield FamilyErrorState();
    }
  }

  Stream<FamilyState> registerPet(RegisterPetEvent event) async* {
    final _state = state;
    if (_state is FamilyLoadedState) {
      yield PetRegisteringState();
      try {
        final family = await FamilyRepository.registerPet(
          event.userID,
          _state.family,
          name: event.name,
          breedID: event.breedID,
        );
        yield FamilyLoadedState(family: family);
      } catch (e) {
        print(e);
        yield FamilyErrorState();
      }
    }
  }
}
