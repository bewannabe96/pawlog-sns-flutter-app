// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendEntity _$FriendEntityFromJson(Map<String, dynamic> json) {
  return FriendEntity(
    userid: json['userid'] as int,
    email: json['email'] as String,
    name: json['name'] as String,
    imageurl: json['imageurl'] as String,
  );
}

Map<String, dynamic> _$FriendEntityToJson(FriendEntity instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'email': instance.email,
      'name': instance.name,
      'imageurl': instance.imageurl,
    };
