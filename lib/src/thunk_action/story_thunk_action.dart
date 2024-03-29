import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/repository/story_repository.dart';

import 'package:pawlog/src/action/story_action.dart';

ThunkAction<AppState> loadFeedStories() {
  return (Store<AppState> store) async {
    store.dispatch(StartLoadingFeedAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }

      final stories = await StoryRepository.loadStories(
          1, store.state.authState.user.userID);

      store.dispatch(UpdateFeedAction(stories, 1, stories.length < 10));
    } catch (e) {
      store.dispatch(ThrowFeedErrorAction(e.toString()));
    }
  };
}

ThunkAction<AppState> loadNextFeedStories() {
  return (Store<AppState> store) async {
    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }

      final stories = await StoryRepository.loadStories(
        store.state.feedState.currentPage + 1,
        store.state.authState.user.userID,
      );

      store.dispatch(UpdateFeedAction(
        List.from(store.state.feedState.stories)..addAll(stories),
        store.state.feedState.currentPage + 1,
        stories.length < 10,
      ));
    } catch (e) {
      store.dispatch(ThrowFeedErrorAction(e.toString()));
    }
  };
}

ThunkAction<AppState> loadNextUserStories() {
  return (Store<AppState> store) async {
    store.dispatch(StartLoadingUserStoriesAction());

    try {
      if (!store.state.authState.isAuthorized) {
        throw ('NotAuthorized');
      }
      final stories = await StoryRepository.loadUserStories(
        store.state.authState.user.userID,
        store.state.userStoriesState.currentPage + 1,
        store.state.authState.user.userID,
      );

      store.dispatch(UpdateUserStoriesAction(
        List.from(store.state.userStoriesState.stories)..addAll(stories),
        store.state.userStoriesState.currentPage + 1,
        stories.length < 10,
      ));
    } catch (e) {
      store.dispatch(ThrowUserStoriesErrorAction(e.toString()));
    }
  };
}

ThunkAction<AppState> loadStoryDetail(Story story) {
  return (Store<AppState> store) async {
    store.dispatch(StartLoadingStoryDetailAction(story));

    try {
      final comments = await StoryRepository.loadComments(story.storyID, 1);

      store.dispatch(
          UpdateStoryCommentsAction(comments, 1, comments.length < 10));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> loadNextStoryComments() {
  return (Store<AppState> store) async {
    final currentStoryDetailState = store.state.storyDetailState;

    try {
      final comments = await StoryRepository.loadComments(
        currentStoryDetailState.story.storyID,
        currentStoryDetailState.currentCommentsPage + 1,
      );

      store.dispatch(UpdateStoryCommentsAction(
        List.from(currentStoryDetailState.comments)..addAll(comments),
        currentStoryDetailState.currentCommentsPage + 1,
        comments.length < 10,
      ));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> writeComment(String content) {
  return (Store<AppState> store) async {
    final currentStory = store.state.storyDetailState.story;

    try {
      final comment = await StoryRepository.writeStoryComment(
        currentStory.storyID,
        store.state.authState.user.userID,
        content,
      );

      store.dispatch(UpdateStoryCommentsAction(
        List.from(store.state.storyDetailState.comments)..add(comment),
        store.state.storyDetailState.currentCommentsPage,
        store.state.storyDetailState.commentsReachedMax,
      ));

      store.dispatch(UpdateStoryAction(
        currentStory.copyWith(comments: currentStory.comments + 1),
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
        story.copyWith(
          likes: story.userLiked ? story.likes - 1 : story.likes + 1,
          userLiked: !story.userLiked,
        ),
      ));
    } catch (e) {
      print(e);
    }
  };
}
