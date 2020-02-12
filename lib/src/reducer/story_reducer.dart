import 'package:redux/redux.dart';

import 'package:pawlog/src/state/story_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final storyReducer = combineReducers<StoryState>([
  TypedReducer<StoryState, StartLoadingNextFeedAction>(_startLoadingNextFeed),
  TypedReducer<StoryState, StartReloadingFeedAction>(_startReloadingFeed),
  TypedReducer<StoryState, UpdateFeedStoriesAction>(_updateFeedStories),
  TypedReducer<StoryState, StartLoadingUserStoriesAction>(
      _startLoadingUserStories),
  TypedReducer<StoryState, UpdateUserStoriesAction>(_updateUserStories),
  TypedReducer<StoryState, StartLoadingStoryDetailAction>(
      _startLoadingStoryDetail),
  TypedReducer<StoryState, StartLoadingNextStoryCommentsAction>(
      _startLoadingNextStoryComments),
  TypedReducer<StoryState, UpdateStoryCommentsAction>(_updateStoryComments),
  TypedReducer<StoryState, UpdateStoryAction>(_updateStory),
]);

StoryState _startLoadingNextFeed(
    StoryState state, StartLoadingNextFeedAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      loadingNext: true,
    ),
  );
}

StoryState _startReloadingFeed(
    StoryState state, StartReloadingFeedAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      reloading: true,
    ),
  );
}

StoryState _updateFeedStories(
    StoryState state, UpdateFeedStoriesAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      stories: action.stories,
      currentPage: action.page,
      reachedMax: action.reachedMax,
      loadingNext: false,
      reloading: false,
      error: null,
    ),
  );
}

StoryState _startLoadingUserStories(
    StoryState state, StartLoadingUserStoriesAction action) {
  return state.copyWith(
    userStoriesState: state.userStoriesState.copyWith(
      loading: true,
    ),
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
      loadingStoryDetail: true,
      loadingNextComments: false,
    ),
  );
}

StoryState _startLoadingNextStoryComments(
    StoryState state, StartLoadingNextStoryCommentsAction action) {
  return state.copyWith(
    storyDetailState: state.storyDetailState.copyWith(
      loadingStoryDetail: false,
      loadingNextComments: true,
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
      loadingStoryDetail: false,
      loadingNextComments: false,
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
    storyDetailState: state.storyDetailState.copyWith(
      story: state.storyDetailState.story == action.story
          ? action.story
          : state.storyDetailState.story,
    ),
  );
}
