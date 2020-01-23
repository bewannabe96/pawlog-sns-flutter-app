import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

class FeedManagerAction extends BlocAction {
  const FeedManagerAction();
}

class LoadInitialStoriesAction extends FeedManagerAction {}

class LoadNextStoriesAction extends FeedManagerAction {}

class ReloadStoriesAction extends FeedManagerAction {}

class LikeStoryAction extends FeedManagerAction {}
