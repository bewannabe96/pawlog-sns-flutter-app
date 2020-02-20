import 'package:redux/redux.dart';

import 'package:pawlog/src/state/user_stories_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final userStoriesReducer = combineReducers<UserStoriesState>([
  TypedReducer<UserStoriesState, StartLoadingUserStoriesAction>(
      _startLoadingUserStories),
  TypedReducer<UserStoriesState, UpdateUserStoriesAction>(_updateUserStories),
  TypedReducer<UserStoriesState, ThrowUserStoriesErrorAction>(
      _throwUserStoriesError),
  TypedReducer<UserStoriesState, UpdateStoryAction>(_updateStory),
]);

UserStoriesState _startLoadingUserStories(
    UserStoriesState state, StartLoadingUserStoriesAction action) {
  return state.copyWith(loading: true);
}

UserStoriesState _updateUserStories(
    UserStoriesState state, UpdateUserStoriesAction action) {
  return state.copyWith(
    stories: action.stories,
    currentPage: action.page,
    reachedMax: action.reachedMax,
    loading: false,
    error: null,
  );
}

UserStoriesState _throwUserStoriesError(
    UserStoriesState state, ThrowUserStoriesErrorAction action) {
  return state.copyWith(
    loading: false,
    error: action.error,
  );
}

UserStoriesState _updateStory(
    UserStoriesState state, UpdateStoryAction action) {
  return state.copyWith(
    stories: state.stories
        .map((story) => story == action.story ? action.story : story)
        .toList(),
  );
}
