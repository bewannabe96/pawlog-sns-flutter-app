import 'package:equatable/equatable.dart';

import 'package:pawlog/model/model.dart';

abstract class StoryViewEvent extends Equatable {
  const StoryViewEvent();

  @override
  List<Object> get props => null;
}

class StoryViewScreenLoaded extends StoryViewEvent {
  final Story story;

  const StoryViewScreenLoaded({this.story});
}

class ScrolledToEnd extends StoryViewEvent {}

class CommentSubmitted extends StoryViewEvent {
  final String comment;

  const CommentSubmitted({this.comment});
}
