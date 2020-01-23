// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatHeaderEntity _$ChatHeaderEntityFromJson(Map<String, dynamic> json) {
  return ChatHeaderEntity(
    chatid: json['chatid'] as int,
    username: json['username'] as String,
    userimageurl: json['userimageurl'] as String,
    lastmessage: json['lastmessage'] as String,
    lasttime: json['lasttime'] as String,
  );
}

Map<String, dynamic> _$ChatHeaderEntityToJson(ChatHeaderEntity instance) =>
    <String, dynamic>{
      'chatid': instance.chatid,
      'username': instance.username,
      'userimageurl': instance.userimageurl,
      'lastmessage': instance.lastmessage,
      'lasttime': instance.lasttime,
    };
