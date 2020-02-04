import 'package:equatable/equatable.dart';

import 'package:pawlog/src/entity/entity.dart';

class Story extends Equatable {
  final int storyID;

  final String profileImageURL;
  final String profileName;

  final String content;
  final List<String> images;
  final DateTime created;
  final DateTime updated;

  final int likes;
  final int comments;

  final bool userLiked;

  Story._({
    this.storyID,
    this.profileImageURL,
    this.profileName,
    this.content,
    this.images,
    this.created,
    this.updated,
    this.likes,
    this.comments,
    this.userLiked,
  });

  @override
  List<Object> get props => [storyID];

  factory Story.fromEntity(StoryEntity entity) {
    return Story._(
      storyID: entity.storyid,
      profileImageURL: entity.profile,
      profileName: entity.owner,
      content: entity.content,
      images: entity.images,
      created: DateTime.parse(entity.created),
      updated: DateTime.parse(entity.updated),
      likes: entity.likes,
      comments: entity.comments,
      userLiked: entity.userliked,
    );
  }

  Story copyWith({
    int storyID,
    String profileImageURL,
    String profileName,
    String content,
    List<String> images,
    DateTime created,
    DateTime updated,
    int likes,
    int comments,
    bool userLiked,
  }) {
    return Story._(
      storyID: storyID ?? this.storyID,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      profileName: profileName ?? this.profileName,
      content: content ?? this.content,
      images: images ?? this.images,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      userLiked: userLiked ?? this.userLiked,
    );
  }
}

class Comment {
  final String name;
  final String imageURL;
  final String content;
  final DateTime created;

  const Comment._({
    this.name,
    this.imageURL,
    this.content,
    this.created,
  });

  factory Comment.fromEntity(CommentEntity entity) {
    return Comment._(
      name: entity.name,
      imageURL: entity.imageurl,
      content: entity.content,
      created: DateTime.parse(entity.created),
    );
  }
}
