import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/manager/manager.dart';

import 'package:pawlog/rx_screen/home_screen/screen.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import 'package:pawlog/widget/story_item.dart';

class FeedPage extends StatefulWidget with HomeScreenPage {
  FeedPage({Key key}) : super(key: key);

  @override
  IconData icon() => FontAwesomeIcons.solidNewspaper;

  @override
  String title(BuildContext context) => 'Feed';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
  Completer _reloadCompleter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      BlocManagerClusterProvider.of(context).allotAction(
        LoadNextStoriesAction(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedManager =
        BlocManagerClusterProvider.of(context).manager<FeedManager>();

    return StateBuilder(
      stateContainer: feedManager.stateContainer,
      buildOnState: (context, state) => _buildPage(
        context,
        state.stories,
        state.hasReachedMax,
      ),
      buildOnWait: (context) => Center(
        child: PLLoading(),
      ),
      buildOnDefault: (context) => PLError(),
    );
  }

  Widget _buildPage(
    BuildContext context,
    List<Story> stories,
    bool hasReachedMax,
  ) {
    final navigateToStoryView = (Story story) {
      // Navigator.of(context).pushNamed(
      //   StoryViewScreen.routeName,
      //   arguments: StoryViewScreenArgs(story: story),
      // );
    };

    final likeStory = (Story story) {
      // BlocProvider.of<FeedBloc>(context).add(
      //   StoryLikeToggled(story),
      // );
    };

    final refreshFeed = () async {
      // _reloadCompleter = Completer();
      // BlocProvider.of<FeedBloc>(context).add(
      //   FeedReloadRequested(),
      // );
      // return _reloadCompleter.future;
    };

    if (stories.isEmpty) {
      return Center(
        child: Text(
          'No story exists.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: refreshFeed,
      child: ListView.builder(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index < stories.length
              ? StoryItem(
                  story: stories[index],
                  onCommentButtonPressed: navigateToStoryView,
                  onLikeButtonPressed: likeStory,
                )
              : Center(child: PLLoading());
        },
        itemCount: hasReachedMax ? stories.length : stories.length + 1,
      ),
    );
  }
}
