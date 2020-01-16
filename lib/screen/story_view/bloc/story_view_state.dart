import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class StoryViewState extends Equatable {
  const StoryViewState();

  @override
  List<Object> get props => [];
}

class StoryLoading extends StoryViewState {}

class StoryLoaded extends StoryViewState {
  final Story story;
  final List<Comment> comments;
  final int page;
  final bool hasReachedMax;

  final int stateVersion;

  const StoryLoaded({
    @required this.story,
    @required this.comments,
    this.page = 1,
    this.hasReachedMax = false,
    this.stateVersion = 0,
  });

  StoryLoaded copyWith({
    Story story,
    List<Comment> comments,
    int page,
    bool hasReachedMax,
  }) {
    return StoryLoaded(
      story: story ?? this.story,
      comments: comments ?? this.comments,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      stateVersion: stateVersion + 1,
    );
  }

  @override
  List<Object> get props => [stateVersion];
}

class StoryLoadingError extends StoryViewState {}
