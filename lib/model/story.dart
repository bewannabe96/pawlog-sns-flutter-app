import 'package:equatable/equatable.dart';

import 'package:pawlog/entity/entity.dart';

class Story extends Equatable {
  final int storyID;

  final String profileImageURL;
  final String profileName;

  final String content;
  final List<String> images;
  final String created;
  final String updated;

  final int likes;
  final int comments;

  const Story._({
    this.storyID,
    this.profileImageURL,
    this.profileName,
    this.content,
    this.images,
    this.created,
    this.updated,
    this.likes,
    this.comments,
  });

  @override
  List<Object> get props => [storyID];

  factory Story.fromEntity(StoryEntity entity) {
    return Story._(
      storyID: entity.storyID,
      profileImageURL: entity.profileImageURL,
      profileName: entity.profileName,
      content: entity.content,
      images: entity.images,
      created: entity.created,
      updated: entity.updated,
      likes: entity.likes,
      comments: entity.comments,
    );
  }
}
