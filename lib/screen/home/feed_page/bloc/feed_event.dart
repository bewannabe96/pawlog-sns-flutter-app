import 'package:equatable/equatable.dart';

import 'package:pawlog/model/model.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedPageLoaded extends FeedEvent {}

class FeedReloadRequested extends FeedEvent {}

class FeedScrolledToEnd extends FeedEvent {}

class StoryLikeToggled extends FeedEvent {
  final Story story;

  const StoryLikeToggled(this.story);
}
