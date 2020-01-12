import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class StoryCommentsState extends Equatable {
  const StoryCommentsState();

  @override
  List<Object> get props => [];
}

class InitialStoryCommentsState extends StoryCommentsState {}

class CommentsLoadingState extends StoryCommentsState {
  const CommentsLoadingState();
}

class CommentsLoadedState extends StoryCommentsState {
  final List<Comment> comments;

  const CommentsLoadedState({
    @required this.comments,
  });
}

class CommentsErrorState extends StoryCommentsState {
  const CommentsErrorState();
}
