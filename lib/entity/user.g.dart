// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    userid: json['userid'] as int,
    email: json['email'] as String,
    name: json['name'] as String,
    imageurl: json['imageurl'] as String,
    intro: json['intro'] as String,
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'email': instance.email,
      'name': instance.name,
      'imageurl': instance.imageurl,
      'intro': instance.intro,
    };

UserSearchResultEntity _$UserSearchResultEntityFromJson(
    Map<String, dynamic> json) {
  return UserSearchResultEntity(
    userid: json['userid'] as int,
    imageurl: json['imageurl'] as String,
    name: json['name'] as String,
    intro: json['intro'] as String,
  );
}

Map<String, dynamic> _$UserSearchResultEntityToJson(
        UserSearchResultEntity instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'imageurl': instance.imageurl,
      'name': instance.name,
      'intro': instance.intro,
    };
