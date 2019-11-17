import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Story extends Equatable {
  final int storyID;
  final String content;
  final String created;
  final String updated;
  final int like;
  final int comment;

  const Story({
    @required this.storyID,
    @required this.content,
    @required this.created,
    @required this.updated,
    @required this.like,
    @required this.comment,
  }) : assert(storyID != null);

  @override
  List<Object> get props => [storyID];

  static Story fromJSON(dynamic json) {
    return Story(
      storyID: json['storyid'],
      content: json['content'],
      created: json['created'],
      updated: json['updated'],
      like: json['likes'],
      comment: json['comments'],
    );
  }
}
