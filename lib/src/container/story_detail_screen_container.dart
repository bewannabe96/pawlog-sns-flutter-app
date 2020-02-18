import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/story_thunk_action.dart';

class StoryDetailScreenContainer extends StatelessWidget {
  static const routeName = StoryDetailScreen.routeName;

  final StoryDetailScreenArgs args;

  const StoryDetailScreenContainer(this.args);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoryDetailScreenProps>(
      converter: (store) => _mapStateToProps(store),
      onInit: (store) => store.dispatch(loadStoryDetail(args.story)),
      builder: (context, props) => StoryDetailScreen(props: props),
    );
  }
}

StoryDetailScreenProps _mapStateToProps(Store<AppState> store) {
  return StoryDetailScreenProps(
    story: store.state.storyState.storyDetailState.story,
    comments: store.state.storyState.storyDetailState.comments,
    loading: store.state.storyState.storyDetailState.loading,
    loadNextComments: () => store.dispatch(loadNextStoryComments()),
    writeComment: (String content) => store.dispatch(writeComment(content)),
  );
}
