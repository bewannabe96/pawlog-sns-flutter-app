import 'package:equatable/equatable.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

class FriendPageLoaded extends FriendEvent {}
