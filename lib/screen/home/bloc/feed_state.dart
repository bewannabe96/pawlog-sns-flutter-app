import 'package:equatable/equatable.dart';
import 'package:pawlog/model/model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class StoriesFirstLoading extends FeedState {}

class StoriesReloading extends FeedState {}

class StoriesLoading extends FeedState {}

class StoriesLoaded extends FeedState {
  final List<Story> stories;
  final int page;
  final bool hasReachedMax;

  const StoriesLoaded({
    this.stories,
    this.page = 1,
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [stories, hasReachedMax];

  StoriesLoaded copyWith({
    List<Story> stories,
    int page,
    bool hasReachedMax,
  }) {
    return StoriesLoaded(
      stories: stories ?? this.stories,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class StoriesLoadedFailed extends FeedState {}
