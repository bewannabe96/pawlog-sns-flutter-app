import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class StoryState extends Equatable {
  final _FeedState feedState;
  final _StoryDetailState storyDetailState;

  StoryState._({
    this.feedState,
    this.storyDetailState,
  });

  @override
  List<Object> get props => [feedState, storyDetailState];

  StoryState copyWith({
    _FeedState feedState,
    _StoryDetailState storyDetailState,
  }) {
    return StoryState._(
      feedState: feedState ?? this.feedState,
      storyDetailState: storyDetailState ?? this.storyDetailState,
    );
  }

  factory StoryState.initialState() => StoryState._(
        feedState: _FeedState.initialState(),
        storyDetailState: _StoryDetailState.initialState(),
      );
}

class _FeedState extends Equatable {
  final List<Story> stories;
  final int currentPage;
  final bool reachedMax;
  final bool loadingNext;
  final bool reloading;
  final String error;

  const _FeedState._({
    this.stories,
    this.currentPage,
    this.reachedMax,
    this.loadingNext,
    this.reloading,
    this.error,
  });

  @override
  List<Object> get props => [currentPage];

  _FeedState copyWith({
    List<Story> stories,
    int currentPage,
    bool reachedMax,
    bool loadingNext,
    bool reloading,
    String error,
  }) {
    return _FeedState._(
      stories: stories ?? this.stories,
      currentPage: currentPage ?? this.currentPage,
      reachedMax: reachedMax ?? this.reachedMax,
      loadingNext: loadingNext ?? this.loadingNext,
      reloading: reloading ?? this.reloading,
      error: error ?? this.error,
    );
  }

  factory _FeedState.initialState() => _FeedState._(
        stories: const [],
        currentPage: 0,
        reachedMax: false,
        loadingNext: false,
        reloading: false,
        error: null,
      );
}

class _StoryDetailState extends Equatable {
  final Story story;
  final List<Comment> comments;
  final int currentCommentsPage;
  final bool commentsReachedMax;
  final bool loadingStoryDetail;
  final bool loadingNextComments;
  final String error;

  const _StoryDetailState._({
    this.story,
    this.comments,
    this.currentCommentsPage,
    this.commentsReachedMax,
    this.loadingStoryDetail,
    this.loadingNextComments,
    this.error,
  });

  @override
  List<Object> get props => [story.storyID];

  _StoryDetailState copyWith({
    Story story,
    List<Comment> comments,
    int currentCommentsPage,
    bool commentsReachedMax,
    bool loadingStoryDetail,
    bool loadingNextComments,
    String error,
  }) {
    return _StoryDetailState._(
      story: story ?? this.story,
      comments: comments ?? this.comments,
      currentCommentsPage: currentCommentsPage ?? this.currentCommentsPage,
      commentsReachedMax: commentsReachedMax ?? this.commentsReachedMax,
      loadingStoryDetail: loadingStoryDetail ?? this.loadingStoryDetail,
      loadingNextComments: loadingNextComments ?? this.loadingNextComments,
      error: error ?? this.error,
    );
  }

  factory _StoryDetailState.initialState() => _StoryDetailState._(
        story: null,
        comments: const [],
        currentCommentsPage: 0,
        commentsReachedMax: false,
        loadingStoryDetail: false,
        loadingNextComments: false,
        error: null,
      );
}
