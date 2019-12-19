import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class SyncConfigState extends Equatable {
  const SyncConfigState();
}

class InitialSyncConfigState extends SyncConfigState {
  @override
  List<Object> get props => [];
}

class ConfigLoadingState extends SyncConfigState {
  const ConfigLoadingState();

  @override
  List<Object> get props => [];
}

class ConfigLoadedState extends SyncConfigState {
  final SyncConfig config;

  const ConfigLoadedState({
    @required this.config,
  });

  @override
  List<Object> get props => [];
}

class SyncConfigErrorState extends SyncConfigState {
  const SyncConfigErrorState();

  @override
  List<Object> get props => [];
}
