import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChatsEvent extends ChatEvent {
  final int userID;

  const LoadChatsEvent(this.userID);
}
