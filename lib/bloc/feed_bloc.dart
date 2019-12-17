import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  @override
  FeedState get initialState => InitialFeedState();

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if (event is LoadStoriesEvent) {
      yield* loadStories();
    }
  }

  Stream<FeedState> loadStories() async* {
    final currentState = state;

    yield StoriesLoadingState();

    // If no more stories to be loaded
    if (currentState is StoriesLoadedState && currentState.hasReachedMax) {
      return;
    }

    try {
      if (currentState is InitialFeedState) {
        final stories = await FeedRepository.loadStories(0);
        yield StoriesLoadedState(
          stories: stories,
          hasReachedMax: stories.isEmpty,
        );
      } else if (currentState is StoriesLoadedState) {
        final stories = await FeedRepository.loadStories(currentState.page + 1);
        yield currentState.copyWith(
          stories: stories,
          hasReachedMax: stories.isEmpty,
        );
      }
    } catch (_) {
      yield FeedErrorState();
    }
  }
}
