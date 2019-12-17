import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FeedState extends Equatable {
  const FeedState();
}

class InitialFeedState extends FeedState {
  @override
  List<Object> get props => [];
}

class StoriesLoadingState extends FeedState {
  const StoriesLoadingState();

  @override
  List<Object> get props => [];
}

class StoriesLoadedState extends FeedState {
  final List<Story> stories;
  final int page;
  final bool hasReachedMax;

  const StoriesLoadedState({
    @required this.stories,
    this.page = 0,
    this.hasReachedMax = false,
  });

  StoriesLoadedState copyWith({
    @required List<Story> stories,
    bool hasReachedMax,
  }) {
    return StoriesLoadedState(
      stories: this.stories + stories,
      page: this.page + 1,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [];
}

class FeedErrorState extends FeedState {
  const FeedErrorState();

  @override
  List<Object> get props => [];
}
