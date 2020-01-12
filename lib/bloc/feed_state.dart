import 'package:pawlog/model/model.dart';

abstract class FeedState {
  const FeedState();
}

class InitialFeedState extends FeedState {
  const InitialFeedState();
}

class StoriesLoadingState extends FeedState {
  const StoriesLoadingState();
}

class StoriesLoadedState extends FeedState {
  final List<Story> stories;
  final int page;
  final bool hasReachedMax;

  const StoriesLoadedState({
    this.stories,
    this.page = 1,
    this.hasReachedMax = false,
  });

  StoriesLoadedState copy({
    List<Story> stories,
    int page,
    bool hasReachedMax,
  }) {
    return StoriesLoadedState(
      stories: stories ?? this.stories,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class FeedErrorState extends FeedState {
  const FeedErrorState();
}
