import 'package:equatable/equatable.dart';

abstract class SyncConfigEvent extends Equatable {
  const SyncConfigEvent();
}

class LoadSyncConfigEvent extends SyncConfigEvent {
  const LoadSyncConfigEvent();

  @override
  List<Object> get props => [];
}
