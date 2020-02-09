import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class StoryState extends Equatable {
  final _FeedState feedState;

  StoryState._({
    this.feedState,
  });

  @override
  List<Object> get props => [feedState];

  StoryState copyWith({
    _FeedState feedState,
  }) {
    return StoryState._(
      feedState: feedState ?? this.feedState,
    );
  }

  factory StoryState.initialState() => StoryState._(
        feedState: _FeedState.initialState(),
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
