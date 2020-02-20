import 'package:pawlog/src/model/model.dart';

class StartLoadingFeedAction {
  @override
  String toString() => 'StartLoadingFeedAction';
}

class UpdateFeedAction {
  final List<Story> stories;
  final int page;
  final bool reachedMax;

  UpdateFeedAction(this.stories, this.page, this.reachedMax);

  @override
  String toString() =>
      'UpdateFeedAction {total: ${stories.length}, page: $page, max: $reachedMax}';
}

class ThrowFeedErrorAction {
  String error;

  ThrowFeedErrorAction(this.error);

  @override
  String toString() => 'ThrowFeedErrorAction {$error}';
}

class StartLoadingUserStoriesAction {
  @override
  String toString() => 'StartLoadingUserStoriesAction';
}

class UpdateUserStoriesAction {
  final List<Story> stories;
  final int page;
  final bool reachedMax;

  UpdateUserStoriesAction(
    this.stories,
    this.page,
    this.reachedMax,
  );

  @override
  String toString() =>
      'UpdateUserStoriesAction {total: ${stories.length}, page: $page, max: $reachedMax}';
}

class ThrowUserStoriesErrorAction {
  String error;

  ThrowUserStoriesErrorAction(this.error);

  @override
  String toString() => 'ThrowUserStoriesErrorAction {$error}';
}

class StartLoadingStoryDetailAction {
  final Story story;

  StartLoadingStoryDetailAction(this.story);

  @override
  String toString() => 'StartLoadingStoryDetailAction {story: ${story.storyID}';
}

class UpdateStoryCommentsAction {
  final List<Comment> comments;
  final int page;
  final bool reachedMax;

  UpdateStoryCommentsAction(this.comments, this.page, this.reachedMax);

  @override
  String toString() =>
      'UpdateStoryCommentsAction {total: ${comments.length}, page: $page, max: $reachedMax}';
}

class UpdateStoryAction {
  final Story story;

  UpdateStoryAction(this.story);

  @override
  String toString() => 'UpdateStoryAction {storyID: ${story.storyID}}';
}
