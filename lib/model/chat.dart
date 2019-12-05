import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Chat extends Equatable {
  final int chatID;
  final String userName;
  final String lastMessage;
  final String lastMessageTime;

  const Chat({
    @required this.chatID,
    @required this.userName,
    this.lastMessage,
    this.lastMessageTime,
  });

  @override
  List<Object> get props => [chatID];
}
