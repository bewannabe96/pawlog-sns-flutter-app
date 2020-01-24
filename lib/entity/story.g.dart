// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryEntity _$StoryEntityFromJson(Map<String, dynamic> json) {
  return StoryEntity(
    storyid: json['storyid'] as int,
    profile: json['profile'] as String,
    owner: json['owner'] as String,
    content: json['content'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    created: json['created'] as String,
    updated: json['updated'] as String,
    likes: json['likes'] as int,
    comments: json['comments'] as int,
    userliked: json['userliked'] as bool,
  );
}

Map<String, dynamic> _$StoryEntityToJson(StoryEntity instance) =>
    <String, dynamic>{
      'storyid': instance.storyid,
      'profile': instance.profile,
      'owner': instance.owner,
      'content': instance.content,
      'images': instance.images,
      'created': instance.created,
      'updated': instance.updated,
      'likes': instance.likes,
      'comments': instance.comments,
      'userliked': instance.userliked,
    };

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) {
  return CommentEntity(
    name: json['name'] as String,
    imageurl: json['imageurl'] as String,
    content: json['content'] as String,
    created: json['created'] as String,
  );
}

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageurl': instance.imageurl,
      'content': instance.content,
      'created': instance.created,
    };
