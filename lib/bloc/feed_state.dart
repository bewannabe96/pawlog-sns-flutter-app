import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class InitialFeedState extends FeedState {}

class StoriesLoadingState extends FeedState {
  const StoriesLoadingState();
}

class StoriesLoadedState extends FeedState {
  final List<Story> stories;
  final int page;
  final bool hasReachedMax;

  const StoriesLoadedState({
    @required this.stories,
    this.page = 1,
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
}

class FeedErrorState extends FeedState {
  const FeedErrorState();
}
