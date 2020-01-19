import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final AuthenticationBloc _authenticationBloc;

  FeedBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FeedState get initialState => StoriesFirstLoadProgress();

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if (event is FeedPageLoaded) {
      yield* _mapFeedPageLoadedToState(event);
    } else if (event is FeedReloadRequested) {
      yield* _mapFeedReloadRequestedToState(event);
    } else if (event is FeedScrolledToEnd) {
      yield* _mapFeedScrolledToEndToState(event);
    } else if (event is StoryLikeToggled) {
      yield* _mapStoryLikeToggledToState(event);
    }
  }

  Stream<FeedState> _mapFeedPageLoadedToState(
    FeedPageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      try {
        final stories = await StoryRepository.loadStories(
          1,
          authState.user.userID,
        );

        yield StoriesLoadSuccess(
          stories: stories,
          hasReachedMax: stories.length < 10,
        );
      } catch (e) {
        yield StoriesLoadFailure();
      }
    }
  }

  Stream<FeedState> _mapFeedReloadRequestedToState(
    FeedReloadRequested event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      try {
        final stories = await StoryRepository.loadStories(
          1,
          authState.user.userID,
        );

        yield StoriesLoadSuccess(
          stories: stories,
          hasReachedMax: stories.length < 10,
        );
      } catch (e) {
        yield StoriesLoadFailure();
      }
    }
  }

  Stream<FeedState> _mapFeedScrolledToEndToState(
    FeedScrolledToEnd event,
  ) async* {
    final currentState = state;
    final authState = _authenticationBloc.state;

    if (authState is Authenticated &&
        currentState is StoriesLoadSuccess &&
        !currentState.hasReachedMax) {
      try {
        yield StoriesLoadProgress();
        final stories = await StoryRepository.loadStories(
          currentState.page + 1,
          authState.user.userID,
        );
        yield currentState.copyWith(
          stories: currentState.stories + stories,
          page: currentState.page + 1,
          hasReachedMax: stories.length < 10,
        );
      } catch (e) {
        yield StoriesLoadFailure();
      }
    }
  }

  Stream<FeedState> _mapStoryLikeToggledToState(
    StoryLikeToggled event,
  ) async* {
    final currentState = state;
    final authState = _authenticationBloc.state;

    if (authState is Authenticated && currentState is StoriesLoadSuccess) {
      final index = currentState.stories.indexOf(event.story);

      try {
        currentState.stories[index] = event.story.copyWith(
          likes: event.story.userLiked
              ? event.story.likes - 1
              : event.story.likes + 1,
          userLiked: !event.story.userLiked,
        );
        yield currentState.copyWith();
        // yield StoriesLoadFailure();

        await StoryRepository.toggleStoryLike(
          event.story.storyID,
          authState.user.userID,
          event.story.userLiked,
        );
      } catch (_) {
        currentState.stories[index] = event.story;
        yield currentState;
      }
    }
  }
}
