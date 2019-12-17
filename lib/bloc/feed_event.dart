import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();
}

class LoadStoriesEvent extends FeedEvent {
  const LoadStoriesEvent();

  @override
  List<Object> get props => [];
}
