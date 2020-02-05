import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/src/entity/entity.dart';

class ChatHeader extends Equatable {
  final int chatID;
  final String userName;
  final String userImageURL;
  final String lastMessage;
  final String lastTime;

  const ChatHeader._({
    @required this.chatID,
    @required this.userName,
    this.userImageURL,
    this.lastMessage,
    this.lastTime,
  });

  @override
  List<Object> get props => [chatID];

  factory ChatHeader.fromEntity(ChatHeaderEntity entity) {
    return ChatHeader._(
      chatID: entity.chatid,
      userName: entity.username,
      userImageURL: entity.userimageurl,
      lastMessage: entity.lastmessage,
      lastTime: entity.lasttime,
    );
  }
}
