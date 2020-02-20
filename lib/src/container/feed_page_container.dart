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
    return StoreConnector<AppState, FeedPageProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => FeedPage(props: props),
    );
  }
}

FeedPageProps _mapStateToProps(Store<AppState> store) {
  return FeedPageProps(
    stories: store.state.feedState.stories,
    reloading: store.state.feedState.loading,
    reachedMax: store.state.feedState.reachedMax,
    loadNextFeedStories: () => store.dispatch(loadNextFeedStories()),
    loadFeedStories: () => store.dispatch(loadFeedStories()),
    toggleStoryLike: (Story story) => store.dispatch(toggleStoryLike(story)),
  );
}
