import 'package:redux/redux.dart';

import 'package:pawlog/src/state/story_detail_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final storyDetailReducer = combineReducers<StoryDetailState>([
  TypedReducer<StoryDetailState, StartLoadingStoryDetailAction>(
      _startLoadingStoryDetail),
  TypedReducer<StoryDetailState, UpdateStoryCommentsAction>(
      _updateStoryComments),
  TypedReducer<StoryDetailState, UpdateStoryAction>(_updateStory),
]);

StoryDetailState _startLoadingStoryDetail(
    StoryDetailState state, StartLoadingStoryDetailAction action) {
  return state.copyWith(
    story: action.story,
    loading: true,
  );
}

StoryDetailState _updateStoryComments(
    StoryDetailState state, UpdateStoryCommentsAction action) {
  return state.copyWith(
    comments: action.comments,
    currentCommentsPage: action.page,
    commentsReachedMax: action.reachedMax,
    loading: false,
    error: null,
  );
}

StoryDetailState _updateStory(
    StoryDetailState state, UpdateStoryAction action) {
  return state.copyWith(
    story: state.story == action.story ? action.story : state.story,
  );
}
