import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/presentation/widget/loading_indicator.dart';
import 'package:pawlog/src/presentation/widget/story_item.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  static const double _scrollThreshold = 100.0;

  final ScrollController _scrollController = ScrollController();

  bool _isLoadingNextStories = false;

  // TODO: needs replacement
  List<Story> _stories = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialStories();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 0 && currentScroll > maxScroll - _scrollThreshold)
      _loadNextStories();
  }

  void _loadInitialStories() async {
    // TODO: needs implementation
    var jsonstring = await rootBundle.loadString('res/sample/stories.json');
    final json = jsonDecode(jsonstring);

    final entities =
        (json['stories'] as List).map((j) => StoryEntity.fromJson(j)).toList();
    final stories = entities.map((entity) => Story.fromEntity(entity)).toList();

    setState(() {
      _stories = stories;
    });
  }

  void _loadNextStories() async {
    if (_isLoadingNextStories) return;
    _isLoadingNextStories = true;
    // TODO: needs implementation
    print('load next stories');
    await Future.delayed(Duration(seconds: 3));
    print('load completed');
    _isLoadingNextStories = false;
  }

  void _navigateToStoryDetail(Story story) {
    Navigator.of(context).pushNamed(
      StoryDetailScreen.routeName,
      arguments: StoryDetailScreenArgs(story: story),
    );
  }

  void _likeStory(Story story) {
    // TODO: needs implementation
    print('like stories');
  }

  Future<void> _refreshStories() async {
    // TODO: needs implementation
    print('refresh stories');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context, _stories, false);
  }

  Widget _buildPage(
    BuildContext context,
    List<Story> stories,
    bool hasReachedMax,
  ) {
    if (stories.isEmpty) {
      return const Center(
        child: const Text(
          'No story exists.',
          style: const TextStyle(color: darkSecondaryColor),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshStories,
      child: ListView.builder(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index < stories.length
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StoryItem(
                    story: stories[index],
                    onCommentButtonPressed: _navigateToStoryDetail,
                    onLikeButtonPressed: _likeStory,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Center(child: LoadingIndicator()),
                );
        },
        itemCount: hasReachedMax ? stories.length : stories.length + 1,
      ),
    );
  }
}
