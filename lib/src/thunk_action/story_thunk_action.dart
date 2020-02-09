import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/story_action.dart';

import 'package:pawlog/src/repository/story_repository.dart';

ThunkAction<AppState> loadNextStories() {
  return (Store<AppState> store) async {
    if (store.state.storyState.feedState.loadingNext ||
        store.state.storyState.feedState.reachedMax) return;
    store.dispatch(StartLoadingNextFeedAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }
      final stories = await StoryRepository.loadStories(
        store.state.storyState.feedState.currentPage + 1,
        store.state.authState.user.userID,
      );
      store.dispatch(FinishLoadingFeedAction(
        stories: List.from(store.state.storyState.feedState.stories)
          ..addAll(stories),
        page: store.state.storyState.feedState.currentPage + 1,
        reachedMax: stories.length < 10,
      ));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> reloadStories() {
  return (Store<AppState> store) async {
    if (store.state.storyState.feedState.reloading) return;

    store.dispatch(StartReloadingFeedAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }
      final stories = await StoryRepository.loadStories(
        1,
        store.state.authState.user.userID,
      );
      store.dispatch(FinishLoadingFeedAction(
        stories: stories,
        page: 1,
        reachedMax: stories.length < 10,
      ));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> toggleStoryLike(Story story) {
  return (Store<AppState> store) async {
    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }
      if (story.userLiked)
        await StoryRepository.unlikeStory(
          story.storyID,
          store.state.authState.user.userID,
        );
      else
        await StoryRepository.likeStory(
          story.storyID,
          store.state.authState.user.userID,
        );

      store.dispatch(UpdateStoryAction(
        story: story.copyWith(
          likes: story.userLiked ? story.likes - 1 : story.likes + 1,
          userLiked: !story.userLiked,
        ),
      ));
    } catch (e) {
      print(e);
    }
  };
}
