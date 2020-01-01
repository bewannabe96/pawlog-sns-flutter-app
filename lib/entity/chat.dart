class ChatHeaderEntity {
  final int chatID;
  final String userName;
  final String lastMessage;
  final String lastTime;

  const ChatHeaderEntity({
    this.chatID,
    this.userName,
    this.lastMessage,
    this.lastTime,
  });

  factory ChatHeaderEntity.fromJson(Map<String, dynamic> json) {
    return ChatHeaderEntity(
      chatID: json['chatid'],
      userName: json['username'],
      lastMessage: json['lastmessage'],
      lastTime: json['lasttime'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['chatid'] = chatID;
    json['username'] = userName;
    json['lastmessage'] = lastMessage;
    json['lasttime'] = lastTime;

    return json;
  }
}
