import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class ChatHeaderEntity {
  final int chatid;
  final String username;
  final String userimageurl;
  final String lastmessage;
  final String lasttime;

  const ChatHeaderEntity({
    this.chatid,
    this.username,
    this.userimageurl,
    this.lastmessage,
    this.lasttime,
  });

  factory ChatHeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatHeaderEntityFromJson(json);
}
