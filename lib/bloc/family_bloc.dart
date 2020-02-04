import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/src/repository/repository.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {
  final AuthenticationBloc _authenticationBloc;

  FamilyBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

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
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield FamilyCreatingState();
      try {
        final family = await FamilyRepository.createFamily(
            authState.user.userID,
            name: event.name);
        yield FamilyLoadedState(family: family);
      } catch (_) {}
    }
  }

  Stream<FamilyState> loadFamily(LoadFamilyEvent event) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield FamilyLoadingState();
      try {
        final family = await FamilyRepository.loadFamily(authState.user.userID);
        yield FamilyLoadedState(family: family);
      } catch (e) {
        yield FamilyErrorState();
      }
    }
  }

  Stream<FamilyState> registerPet(RegisterPetEvent event) async* {
    final currentState = state;
    final authState = _authenticationBloc.state;

    if (authState is Authenticated && currentState is FamilyLoadedState) {
      yield PetRegisteringState();
      try {
        final family = await FamilyRepository.registerPet(
          authState.user.userID,
          currentState.family,
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
