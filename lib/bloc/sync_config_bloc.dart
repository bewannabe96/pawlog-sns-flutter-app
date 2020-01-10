import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class SyncConfigBloc extends Bloc<SyncConfigEvent, SyncConfigState> {
  @override
  SyncConfigState get initialState => InitialSyncConfigState();

  @override
  Stream<SyncConfigState> mapEventToState(
    SyncConfigEvent event,
  ) async* {
    if (event is LoadSyncConfigEvent) {
      yield* loadSyncConfig(event);
    }
  }

  Stream<SyncConfigState> loadSyncConfig(LoadSyncConfigEvent event) async* {
    yield ConfigLoadingState();
    try {
      final config = await ConfigRepository.loadConfig();
      yield ConfigLoadedState(config: config);
    } catch (e) {
      print(e);
      yield SyncConfigErrorState();
    }
  }
}
