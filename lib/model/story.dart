import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class Story extends Equatable {
  final int storyID;
  final String content;
  final List<String> images;
  final String created;
  final String updated;
  final int likes;
  final int comments;

  const Story._({
    @required this.storyID,
    @required this.content,
    @required this.images,
    @required this.created,
    @required this.updated,
    @required this.likes,
    @required this.comments,
  });

  @override
  List<Object> get props => [storyID];

  factory Story.fromEntity(StoryEntity entity) {
    return Story._(
      storyID: entity.storyID,
      content: entity.content,
      images: entity.images,
      created: entity.created,
      updated: entity.updated,
      likes: entity.likes,
      comments: entity.comments,
    );
  }
}
