import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/screen/home/bloc/feed_bloc.dart';

import 'package:pawlog/repository/repository.dart';

class StoryViewBloc extends Bloc<StoryViewEvent, StoryViewState> {
  final AuthenticationBloc _authenticationBloc;
  // final FeedBloc _feedBloc;

  StoryViewBloc({
    @required AuthenticationBloc authenticationBloc,
    // @required FeedBloc feedBloc,
  })  : assert(authenticationBloc != null),
        // assert(feedBloc != null),
        _authenticationBloc = authenticationBloc;
  // _feedBloc = feedBloc;

  @override
  StoryViewState get initialState => StoryLoading();

  @override
  Stream<StoryViewState> mapEventToState(
    StoryViewEvent event,
  ) async* {
    if (event is StoryViewScreenLoaded) {
      yield* _mapStoryViewScreenLoadedToState(event);
    } else if (event is ScrolledToEnd) {
      yield* _mapScrolledToEndToState(event);
    } else if (event is CommentSubmitted) {
      yield* _mapCommentSubmittedToState(event);
    }
  }

  Stream<StoryViewState> _mapStoryViewScreenLoadedToState(
    StoryViewScreenLoaded event,
  ) async* {
    yield StoryLoading();
    try {
      final comments = await StoryRepository.loadComments(
        event.story.storyID,
        1,
      );
      yield StoryLoaded(
          story: event.story,
          comments: comments,
          hasReachedMax: comments.length < 10);
    } catch (e) {
      yield StoryLoadingError();
    }
  }

  Stream<StoryViewState> _mapScrolledToEndToState(
    ScrolledToEnd event,
  ) async* {
    final currentState = state;

    if (currentState is StoryLoaded && !currentState.hasReachedMax) {
      try {
        final comments = await StoryRepository.loadComments(
          currentState.story.storyID,
          currentState.page + 1,
        );
        yield currentState.copyWith(
          comments: currentState.comments + comments,
          page: currentState.page + 1,
          hasReachedMax: comments.length < 10,
        );
      } catch (e) {
        yield StoryLoadingError();
      }
    }
  }

  Stream<StoryViewState> _mapCommentSubmittedToState(
    CommentSubmitted event,
  ) async* {
    final currentState = state;
    final authState = _authenticationBloc.state;

    if (authState is Authenticated && currentState is StoryLoaded) {
      try {
        final comment = await StoryRepository.writeStoryComment(
          currentState.story.storyID,
          authState.user.userID,
          event.comment,
        );

        final story = currentState.story.copyWith(
          comments: currentState.story.comments + 1,
        );
        final comments = currentState.comments;
        comments.add(comment);

        yield currentState.copyWith(story: story, comments: comments);
      } catch (e) {}
    }
  }
}
