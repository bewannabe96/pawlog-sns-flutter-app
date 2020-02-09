import 'package:redux/redux.dart';

import 'package:pawlog/src/state/story_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final storyReducer = combineReducers<StoryState>([
  TypedReducer<StoryState, StartLoadingNextFeedAction>(_startLoadingNextFeed),
  TypedReducer<StoryState, StartReloadingFeedAction>(_startReloadingFeed),
  TypedReducer<StoryState, FinishLoadingFeedAction>(_finishLoadingNextFeed),
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

StoryState _finishLoadingNextFeed(
    StoryState state, FinishLoadingFeedAction action) {
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

StoryState _updateStory(StoryState state, UpdateStoryAction action) {
  return state.copyWith(
    feedState: state.feedState.copyWith(
      stories: state.feedState.stories
          .map((story) =>
              story.storyID == action.story.storyID ? action.story : story)
          .toList(),
    ),
  );
}
