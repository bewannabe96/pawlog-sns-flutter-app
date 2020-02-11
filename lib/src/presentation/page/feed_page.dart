import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/presentation/widget/loading_indicator.dart';
import 'package:pawlog/src/presentation/widget/story_item.dart';

class FeedPageProps {
  final List<Story> stories;
  final bool reloading;
  final bool loadingNext;
  final bool reachedMax;

  final Function() loadNextStories;
  final Function() reloadStories;
  final Function(Story) toggleStoryLike;

  const FeedPageProps({
    @required this.stories,
    @required this.reloading,
    @required this.loadingNext,
    @required this.reachedMax,
    @required this.loadNextStories,
    @required this.reloadStories,
    @required this.toggleStoryLike,
  });
}

class FeedPage extends StatefulWidget {
  final FeedPageProps props;

  const FeedPage({
    Key key,
    @required this.props,
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
    if (!widget.props.loadingNext) widget.props.loadNextStories();
  }

  void _navigateToStoryDetail(Story story) {
    Navigator.of(context).pushNamed(
      StoryDetailScreen.routeName,
      arguments: StoryDetailScreenArgs(story: story),
    );
  }

  Future<void> _refreshFeed() async {
    widget.props.reloadStories();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.props.stories.isEmpty
        ? widget.props.reloading
            ? Center(child: LoadingIndicator())
            : _buildNoStory()
        : _buildPage();
  }

  Widget _buildNoStory() {
    return const Center(
      child: const Text(
        'No story exists.',
        style: const TextStyle(color: darkSecondaryColor),
      ),
    );
  }

  Widget _buildPage() {
    return RefreshIndicator(
      onRefresh: _refreshFeed,
      child: ListView.builder(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index < widget.props.stories.length
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StoryItem(
                    story: widget.props.stories[index],
                    onCommentButtonPressed: _navigateToStoryDetail,
                    onLikeButtonPressed: widget.props.toggleStoryLike,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Center(child: LoadingIndicator()),
                );
        },
        itemCount: widget.props.reachedMax
            ? widget.props.stories.length
            : widget.props.stories.length + 1,
      ),
    );
  }
}
