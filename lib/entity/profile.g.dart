// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) {
  return ProfileEntity(
    userid: json['userid'] as int,
    email: json['email'] as String,
    name: json['name'] as String,
    imageurl: json['imageurl'] as String,
    intro: json['intro'] as String,
    stories: json['stories'] as int,
    followers: json['followers'] as int,
    followings: json['followings'] as int,
    isfollowing: json['isfollowing'] as int,
  );
}

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'email': instance.email,
      'name': instance.name,
      'imageurl': instance.imageurl,
      'intro': instance.intro,
      'stories': instance.stories,
      'followers': instance.followers,
      'followings': instance.followings,
      'isfollowing': instance.isfollowing,
    };
