import 'package:pawlog/src/model/model.dart';

class StartLoadingNextFeedAction {
  @override
  String toString() => 'StartLoadingNextFeedAction';
}

class StartReloadingFeedAction {
  @override
  String toString() => 'StartReloadingFeedAction';
}

class UpdateFeedStoriesAction {
  final List<Story> stories;
  final int page;
  final bool reachedMax;

  UpdateFeedStoriesAction(
    this.stories,
    this.page,
    this.reachedMax,
  );

  @override
  String toString() =>
      'UpdateFeedStoriesAction {total: ${stories.length}, page: $page, max: $reachedMax}';
}

class StartLoadingStoryDetailAction {
  final Story story;

  StartLoadingStoryDetailAction(
    this.story,
  );

  @override
  String toString() => 'StartLoadingStoryDetailAction {story: ${story.storyID}';
}

class StartLoadingNextStoryCommentsAction {
  @override
  String toString() => 'StartLoadingNextStoryCommentsAction ';
}

class UpdateStoryCommentsAction {
  final List<Comment> comments;
  final int page;
  final bool reachedMax;

  UpdateStoryCommentsAction(
    this.comments,
    this.page,
    this.reachedMax,
  );

  @override
  String toString() =>
      'UpdateStoryCommentsAction {total: ${comments.length}, page: $page, max: $reachedMax}';
}

class UpdateStoryAction {
  final Story story;

  UpdateStoryAction(
    this.story,
  );

  @override
  String toString() => 'UpdateStoryAction {storyID: ${story.storyID}}';
}
