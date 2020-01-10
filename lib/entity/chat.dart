class ChatHeaderEntity {
  final int chatID;
  final String userName;
  final String userImageURL;
  final String lastMessage;
  final String lastTime;

  const ChatHeaderEntity({
    this.chatID,
    this.userName,
    this.userImageURL,
    this.lastMessage,
    this.lastTime,
  });

  factory ChatHeaderEntity.fromJson(Map<String, dynamic> json) {
    return ChatHeaderEntity(
      chatID: json['chatid'],
      userName: json['username'],
      userImageURL: json['userimageurl'],
      lastMessage: json['lastmessage'],
      lastTime: json['lasttime'],
    );
  }
}
