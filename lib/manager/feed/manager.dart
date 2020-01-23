import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/manager/manager.dart';
import 'package:pawlog/repository/repository.dart';

import 'feed.dart';

class FeedManagerState {
  final List<Story> stories;
  final bool hasReachedMax;

  const FeedManagerState({
    this.stories,
    this.hasReachedMax,
  });
}

class FeedManager extends BlocManager<FeedManagerAction> {
  final stateContainer = StateContainer<FeedManagerState>();

  @override
  Future<void> performAction(FeedManagerAction action) async {
    if (action is LoadInitialStoriesAction) {
      loadInitial();
    } else if (action is LoadNextStoriesAction) {
    } else if (action is ReloadStoriesAction) {
    } else if (action is LikeStoryAction) {}
  }

  loadInitial() async {
    final authStateContainer =
        cluster.manager<AuthenticationManager>().stateContainer;

    if (authStateContainer != null) {
      try {
        final stories = await StoryRepository.loadStories(
          1,
          authStateContainer.state.user.userID,
        );

        stateContainer.setState(FeedManagerState(
          stories: stories,
          hasReachedMax: stories.length < 10,
        ));
      } catch (_) {}
    }
  }
}
