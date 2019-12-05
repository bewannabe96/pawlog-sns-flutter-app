import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Story extends Equatable {
  final int storyID;
  final String content;
  final List<String> images;
  final String created;
  final String updated;
  final int like;
  final int comment;

  const Story({
    @required this.storyID,
    @required this.content,
    this.images = const [],
    @required this.created,
    @required this.updated,
    this.like = 0,
    this.comment = 0,
  });

  @override
  List<Object> get props => [storyID];

  factory Story.fromJSON(Map<String, dynamic> json) {
    return Story(
      storyID: json['storyid'],
      content: json['content'],
      images: json['images'],
      created: json['created'],
      updated: json['updated'],
      like: json['likes'],
      comment: json['comments'],
    );
  }
}
