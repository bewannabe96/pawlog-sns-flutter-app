import 'package:equatable/equatable.dart';
import 'package:pawlog/model/model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class StoriesFirstLoadProgress extends FeedState {}

class StoriesLoadProgress extends FeedState {}

class StoriesLoadSuccess extends FeedState {
  final List<Story> stories;
  final int page;
  final bool hasReachedMax;

  final int stateVersion;

  const StoriesLoadSuccess({
    this.stories,
    this.page = 1,
    this.hasReachedMax = false,
    this.stateVersion = 1,
  });

  @override
  List<Object> get props => [stateVersion];

  StoriesLoadSuccess copyWith({
    List<Story> stories,
    int page,
    bool hasReachedMax,
  }) {
    return StoriesLoadSuccess(
      stories: stories ?? this.stories,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      stateVersion: stateVersion + 1,
    );
  }
}

class StoriesLoadFailure extends FeedState {}
