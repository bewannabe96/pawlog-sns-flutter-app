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

    try {
      if (currentState is InitialFeedState) {
        yield StoriesLoadingState();
        final stories = await StoryRepository.loadStories(1);
        yield StoriesLoadedState(
          stories: stories,
          hasReachedMax: stories.length < 10,
        );
      } else if (currentState is StoriesLoadedState &&
          !currentState.hasReachedMax) {
        yield StoriesLoadingState();
        final stories =
            await StoryRepository.loadStories(currentState.page + 1);
        yield currentState.copyWith(
          stories: stories,
          hasReachedMax: stories.length < 10,
        );
      }
    } catch (e) {
      print(e);
      yield FeedErrorState();
    }
  }
}
