import 'package:pawlog/src/model/model.dart';

class StartLoadingNextFeedAction {
  @override
  String toString() => 'StartLoadingNextFeedAction';
}

class StartReloadingFeedAction {
  @override
  String toString() => 'StartReloadingFeedAction';
}

class FinishLoadingFeedAction {
  final List<Story> stories;
  final int page;
  final bool reachedMax;

  FinishLoadingFeedAction({
    this.stories,
    this.page,
    this.reachedMax,
  });

  @override
  String toString() =>
      'FinishLoadingFeedAction {total: ${stories.length}, page: $page, max: $reachedMax}';
}

class UpdateStoryAction {
  final Story story;

  UpdateStoryAction({
    this.story,
  });

  @override
  String toString() => 'UpdateStoryAction {storyID: ${story.storyID}}';
}
