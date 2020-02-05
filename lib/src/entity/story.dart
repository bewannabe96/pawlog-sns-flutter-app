import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable()
class StoryEntity {
  final int storyid;

  final String profile;
  final String owner;

  final String content;
  final List<String> images;
  final String created;
  final String updated;

  final int likes;
  final int comments;

  final bool userliked;

  const StoryEntity({
    this.storyid,
    this.profile,
    this.owner,
    this.content,
    this.images,
    this.created,
    this.updated,
    this.likes,
    this.comments,
    this.userliked,
  });

  factory StoryEntity.fromJson(Map<String, dynamic> json) =>
      _$StoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StoryEntityToJson(this);
}

@JsonSerializable()
class CommentEntity {
  final String name;
  final String imageurl;
  final String content;
  final String created;

  const CommentEntity({
    this.name,
    this.imageurl,
    this.content,
    this.created,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);
}
