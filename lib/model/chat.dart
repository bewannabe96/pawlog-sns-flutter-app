import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pawlog/entity/entity.dart';

class ChatHeader extends Equatable {
  final int chatID;
  final String userName;
  final String lastMessage;
  final String lastTime;

  const ChatHeader._({
    @required this.chatID,
    @required this.userName,
    this.lastMessage,
    this.lastTime,
  });

  @override
  List<Object> get props => [chatID];

  factory ChatHeader.fromEntity(ChatHeaderEntity entity) {
    return ChatHeader._(
      chatID: entity.chatID,
      userName: entity.userName,
      lastMessage: entity.lastMessage,
      lastTime: entity.lastTime,
    );
  }
}
