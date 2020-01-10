import 'package:equatable/equatable.dart';

abstract class SyncConfigEvent extends Equatable {
  const SyncConfigEvent();

  @override
  List<Object> get props => [];
}

class LoadSyncConfigEvent extends SyncConfigEvent {
  const LoadSyncConfigEvent();
}
