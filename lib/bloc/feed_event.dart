import 'package:equatable/equatable.dart';

import 'package:pawlog/model/model.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class LoadStoriesEvent extends FeedEvent {
  final int userID;

  const LoadStoriesEvent(this.userID);
}

class ToggleStoryLikeEvent extends FeedEvent {
  final Story story;
  final int userID;

  const ToggleStoryLikeEvent(this.story, this.userID);
}
