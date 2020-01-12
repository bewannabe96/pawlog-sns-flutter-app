import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class StoryCommentsBloc extends Bloc<StoryCommentsEvent, StoryCommentsState> {
  @override
  StoryCommentsState get initialState => InitialStoryCommentsState();

  @override
  Stream<StoryCommentsState> mapEventToState(
    StoryCommentsEvent event,
  ) async* {
    if (event is LoadCommentsEvent) {
      yield* loadComments(event);
    } else if (event is WriteCommentEvent) {
      yield* writeComment(event);
    }
  }

  Stream<StoryCommentsState> loadComments(LoadCommentsEvent event) async* {
    yield CommentsLoadingState();
    try {
      final comments = await StoryRepository.loadComments(event.storyID, 1);
      yield CommentsLoadedState(comments: comments);
    } catch (e) {
      yield CommentsErrorState();
    }
  }

  Stream<StoryCommentsState> writeComment(WriteCommentEvent event) async* {
    try {
      await StoryRepository.writeStoryComment(
        event.story.storyID,
        event.userID,
        event.comment,
      );
    } catch (e) {}
  }
}
