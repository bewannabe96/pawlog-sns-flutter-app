import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class LoadProfileEvent extends ProfileEvent {
  final int userID;

  const LoadProfileEvent(this.userID);

  @override
  List<Object> get props => [];
}
