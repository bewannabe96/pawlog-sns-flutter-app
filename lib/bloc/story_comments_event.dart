import 'package:equatable/equatable.dart';

import 'package:pawlog/model/model.dart';

abstract class StoryCommentsEvent extends Equatable {
  const StoryCommentsEvent();

  @override
  List<Object> get props => null;
}

class LoadCommentsEvent extends StoryCommentsEvent {
  final int storyID;

  const LoadCommentsEvent(this.storyID);
}

class WriteCommentEvent extends StoryCommentsEvent {
  final Story story;
  final int userID;
  final String comment;

  const WriteCommentEvent(this.story, this.userID, this.comment);
}
