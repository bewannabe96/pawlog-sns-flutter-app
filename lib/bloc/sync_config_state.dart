import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class SyncConfigState extends Equatable {
  const SyncConfigState();

  @override
  List<Object> get props => [];
}

class InitialSyncConfigState extends SyncConfigState {}

class ConfigLoadingState extends SyncConfigState {
  const ConfigLoadingState();
}

class ConfigLoadedState extends SyncConfigState {
  final SyncConfig config;

  const ConfigLoadedState({
    @required this.config,
  });
}

class SyncConfigErrorState extends SyncConfigState {
  const SyncConfigErrorState();
}
