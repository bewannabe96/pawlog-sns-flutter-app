import 'package:redux/redux.dart';

import 'package:pawlog/src/state/story_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final storyReducer = combineReducers<StoryState>([
  TypedReducer<StoryState, StartLoadingFeedAction>(_startLoadingFeed),
  TypedReducer<StoryState, UpdateFeedAction>(_updateFeed),
  TypedReducer<StoryState, StartLoadingUserStoriesAction>(
      _startLoadingUserStories),
  TypedReducer<StoryState, UpdateUserStoriesAction>(_updateUserStories),
  TypedReducer<StoryState, StartLoadingStoryDetailAction>(
      _startLoadingStoryDetail),
  TypedReducer<StoryState, UpdateStoryCommentsAction>(_updateStoryComments),
  TypedReducer<StoryState, UpdateStoryAction>(_updateStory),
]);

StoryState _startLoadingFeed(StoryState state, StartLoadingFeedAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(loading: true),
  );
}

StoryState _updateFeed(StoryState state, UpdateFeedAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      stories: action.stories,
      currentPage: action.page,
      reachedMax: action.reachedMax,
      loading: false,
      error: null,
    ),
  );
}

StoryState _startLoadingUserStories(
    StoryState state, StartLoadingUserStoriesAction action) {
  return state.copyWith(
    userStoriesState: state.userStoriesState.copyWith(loading: true),
  );
}

StoryState _updateUserStories(
    StoryState state, UpdateUserStoriesAction action) {
  return state.copyWith(
    userStoriesState: state.userStoriesState.copyWith(
      stories: action.stories,
      currentPage: action.page,
      reachedMax: action.reachedMax,
      loading: false,
      error: null,
    ),
  );
}

StoryState _startLoadingStoryDetail(
    StoryState state, StartLoadingStoryDetailAction action) {
  return state.copyWith(
    storyDetailState: state.storyDetailState.copyWith(
      story: action.story,
      loading: true,
    ),
  );
}

StoryState _updateStoryComments(
    StoryState state, UpdateStoryCommentsAction action) {
  return state.copyWith(
    storyDetailState: state.storyDetailState.copyWith(
      comments: action.comments,
      currentCommentsPage: action.page,
      commentsReachedMax: action.reachedMax,
      loading: false,
      error: null,
    ),
  );
}

StoryState _updateStory(StoryState state, UpdateStoryAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      stories: state.feedState.stories
          .map((story) => story == action.story ? action.story : story)
          .toList(),
    ),
    userStoriesState: state.userStoriesState.copyWith(
      stories: state.feedState.stories
          .map((story) => story == action.story ? action.story : story)
          .toList(),
    ),
    storyDetailState: state.storyDetailState.copyWith(
      story: state.storyDetailState.story == action.story
          ? action.story
          : state.storyDetailState.story,
    ),
  );
}