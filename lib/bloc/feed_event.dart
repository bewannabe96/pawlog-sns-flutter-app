import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class LoadStoriesEvent extends FeedEvent {
  const LoadStoriesEvent();
}
