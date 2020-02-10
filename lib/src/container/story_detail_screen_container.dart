import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/story_thunk_action.dart';

class StoryDetailScreenContainer extends StatelessWidget {
  static const routeName = StoryDetailScreen.routeName;

  final StoryDetailScreenArgs args;

  const StoryDetailScreenContainer(this.args);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      onInit: (store) => store.dispatch(loadStoryDetail(args.story)),
      builder: (context, viewmodel) => StoryDetailScreen(
        props: StoryDetailScreenProps(
          story: viewmodel.story,
          comments: viewmodel.comments,
          loadingStoryDetail: viewmodel.loadingStoryDetail,
          loadingNextComments: viewmodel.loadingNextComments,
          loadNextComments: viewmodel.onLoadNextComments,
          writeComment: viewmodel.onWriteComment,
        ),
      ),
    );
  }
}

class _ViewModel {
  final Story story;
  final List<Comment> comments;
  final bool loadingStoryDetail;
  final bool loadingNextComments;

  final Function() onLoadNextComments;
  final Function(String) onWriteComment;

  _ViewModel._({
    this.story,
    this.comments,
    this.loadingStoryDetail,
    this.loadingNextComments,
    this.onLoadNextComments,
    this.onWriteComment,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel._(
      story: store.state.storyState.storyDetailState.story,
      comments: store.state.storyState.storyDetailState.comments,
      loadingStoryDetail:
          store.state.storyState.storyDetailState.loadingStoryDetail,
      loadingNextComments:
          store.state.storyState.storyDetailState.loadingNextComments,
      onLoadNextComments: () => store.dispatch(loadNextStoryComments()),
      onWriteComment: (String content) => store.dispatch(writeComment(content)),
    );
  }
}
