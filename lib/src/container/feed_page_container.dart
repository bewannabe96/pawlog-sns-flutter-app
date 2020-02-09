import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/feed_page.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/story_thunk_action.dart';

class FeedPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => FeedPage(
        stories: viewmodel.stories,
        loadingNext: viewmodel.loadingNext,
        reachedMax: viewmodel.reachedMax,
        loadNextStories: viewmodel.onLoadNextStories,
        reloadStories: viewmodel.onReloadStories,
        toggleStoryLike: viewmodel.onToggleStoryLike,
      ),
    );
  }
}

class _ViewModel {
  final List<Story> stories;
  final bool loadingNext;
  final bool reachedMax;

  final Function onLoadNextStories;
  final Function onReloadStories;
  final Function(Story) onToggleStoryLike;

  _ViewModel._({
    this.stories,
    this.loadingNext,
    this.reachedMax,
    this.onLoadNextStories,
    this.onReloadStories,
    this.onToggleStoryLike,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel._(
      stories: store.state.storyState.feedState.stories,
      loadingNext: store.state.storyState.feedState.loadingNext,
      reachedMax: store.state.storyState.feedState.reachedMax,
      onLoadNextStories: () => store.dispatch(loadNextStories()),
      onReloadStories: () => store.dispatch(reloadStories()),
      onToggleStoryLike: (Story story) =>
          store.dispatch(toggleStoryLike(story)),
    );
  }
}
