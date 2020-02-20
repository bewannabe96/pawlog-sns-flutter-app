import 'package:redux/redux.dart';

import 'package:pawlog/src/state/feed_state.dart';

import 'package:pawlog/src/action/story_action.dart';

final feedReducer = combineReducers<FeedState>([
  TypedReducer<FeedState, StartLoadingFeedAction>(_startLoadingFeed),
  TypedReducer<FeedState, UpdateFeedAction>(_updateFeed),
  TypedReducer<FeedState, ThrowFeedErrorAction>(_throwFeedError),
  TypedReducer<FeedState, UpdateStoryAction>(_updateStory),
]);

FeedState _startLoadingFeed(FeedState state, StartLoadingFeedAction action) {
  return state.copyWith(loading: true);
}

FeedState _updateFeed(FeedState state, UpdateFeedAction action) {
  return state.copyWith(
    stories: action.stories,
    currentPage: action.page,
    reachedMax: action.reachedMax,
    loading: false,
    error: null,
  );
}

FeedState _throwFeedError(FeedState state, ThrowFeedErrorAction action) {
  return state.copyWith(
    loading: false,
    error: action.error,
  );
}

FeedState _updateStory(FeedState state, UpdateStoryAction action) {
  return state.copyWith(
    stories: state.stories
        .map((story) => story == action.story ? action.story : story)
        .toList(),
  );
}
