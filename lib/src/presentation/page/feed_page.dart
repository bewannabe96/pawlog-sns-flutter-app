import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/presentation/widget/loading_indicator.dart';
import 'package:pawlog/src/presentation/widget/story_item.dart';

class FeedPage extends StatefulWidget {
  final List<Story> stories;
  final bool loadingNext;
  final bool reachedMax;

  final Function() loadNextStories;
  final Function() reloadStories;
  final Function(Story) toggleStoryLike;

  FeedPage({
    Key key,
    @required this.stories,
    @required this.loadingNext,
    @required this.reachedMax,
    @required this.loadNextStories,
    @required this.reloadStories,
    @required this.toggleStoryLike,
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  static const double _scrollThreshold = 100.0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 0 && currentScroll > maxScroll - _scrollThreshold)
      _loadNextStories();
  }

  void _loadNextStories() {
    if (!widget.loadingNext) widget.loadNextStories();
  }

  void _navigateToStoryDetail(Story story) {
    Navigator.of(context).pushNamed(
      StoryDetailScreen.routeName,
      arguments: StoryDetailScreenArgs(story: story),
    );
  }

  Future<void> _refreshFeed() async {
    widget.reloadStories();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    if (widget.stories.isEmpty) {
      return const Center(
        child: const Text(
          'No story exists.',
          style: const TextStyle(color: darkSecondaryColor),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshFeed,
      child: ListView.builder(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index < widget.stories.length
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StoryItem(
                    story: widget.stories[index],
                    onCommentButtonPressed: _navigateToStoryDetail,
                    onLikeButtonPressed: widget.toggleStoryLike,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Center(child: LoadingIndicator()),
                );
        },
        itemCount: widget.reachedMax
            ? widget.stories.length
            : widget.stories.length + 1,
      ),
    );
  }
}
