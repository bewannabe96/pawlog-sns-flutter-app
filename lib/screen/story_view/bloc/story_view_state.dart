import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class StoryViewState extends Equatable {
  const StoryViewState();

  @override
  List<Object> get props => [];
}

class StoryLoadProgress extends StoryViewState {}

class StoryLoadSuccess extends StoryViewState {
  final Story story;
  final List<Comment> comments;
  final int page;
  final bool hasReachedMax;

  final int stateVersion;

  const StoryLoadSuccess({
    @required this.story,
    @required this.comments,
    this.page = 1,
    this.hasReachedMax = false,
    this.stateVersion = 1,
  });

  @override
  List<Object> get props => [stateVersion];

  StoryLoadSuccess copyWith({
    Story story,
    List<Comment> comments,
    int page,
    bool hasReachedMax,
  }) {
    return StoryLoadSuccess(
      story: story ?? this.story,
      comments: comments ?? this.comments,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      stateVersion: stateVersion + 1,
    );
  }
}

class StoryLoadFailure extends StoryViewState {}
