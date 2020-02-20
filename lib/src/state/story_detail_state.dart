import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class StoryDetailState extends Equatable {
  final Story story;
  final List<Comment> comments;
  final int currentCommentsPage;
  final bool commentsReachedMax;
  final bool loading;
  final String error;

  const StoryDetailState._({
    this.story,
    this.comments,
    this.currentCommentsPage,
    this.commentsReachedMax,
    this.loading,
    this.error,
  });

  @override
  List<Object> get props => [story.storyID];

  StoryDetailState copyWith({
    Story story,
    List<Comment> comments,
    int currentCommentsPage,
    bool commentsReachedMax,
    bool loading,
    String error,
  }) {
    return StoryDetailState._(
      story: story ?? this.story,
      comments: comments ?? this.comments,
      currentCommentsPage: currentCommentsPage ?? this.currentCommentsPage,
      commentsReachedMax: commentsReachedMax ?? this.commentsReachedMax,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  factory StoryDetailState.initialState() => StoryDetailState._(
        story: null,
        comments: const [],
        currentCommentsPage: 0,
        commentsReachedMax: false,
        loading: false,
        error: null,
      );
}
