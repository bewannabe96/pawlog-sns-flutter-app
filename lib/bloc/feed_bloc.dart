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
      yield* loadStories(event);
    } else if (event is ToggleStoryLikeEvent) {
      yield* toggleStoryLike(event);
    }
  }

  Stream<FeedState> loadStories(LoadStoriesEvent event) async* {
    final currentState = state;

    try {
      if (currentState is InitialFeedState) {
        yield StoriesLoadingState();
        final stories = await StoryRepository.loadStories(
          1,
          event.userID,
        );
        yield StoriesLoadedState(
          stories: stories,
          hasReachedMax: stories.length < 10,
        );
      } else if (currentState is StoriesLoadedState &&
          !currentState.hasReachedMax) {
        yield StoriesLoadingState();
        final stories = await StoryRepository.loadStories(
          currentState.page + 1,
          event.userID,
        );
        yield currentState.copy(
          stories: currentState.stories + stories,
          page: currentState.page + 1,
          hasReachedMax: stories.length < 10,
        );
      }
    } catch (e) {
      print(e);
      yield FeedErrorState();
    }
  }

  Stream<FeedState> toggleStoryLike(ToggleStoryLikeEvent event) async* {
    final currentState = state;

    if (currentState is StoriesLoadedState) {
      final index = currentState.stories.indexOf(event.story);

      try {
        currentState.stories[index] = event.story.copy(
          likes: event.story.userLiked
              ? event.story.likes - 1
              : event.story.likes + 1,
          userLiked: !event.story.userLiked,
        );
        yield currentState.copy();

        await StoryRepository.toggleStoryLike(
          event.story.storyID,
          event.userID,
          event.story.userLiked,
        );
      } catch (_) {
        currentState.stories[index] = event.story;
        yield currentState.copy();
      }
    }
  }
}
