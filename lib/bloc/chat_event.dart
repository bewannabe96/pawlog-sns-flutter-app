import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class LoadChatsEvent extends ChatEvent {
  final int userID;

  const LoadChatsEvent(this.userID);

  @override
  List<Object> get props => [];
}
