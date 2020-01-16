import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/screen/story_view/screen.dart';

import 'package:pawlog/widget/story_item.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

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
      BlocProvider.of<FeedBloc>(context).add(FeedScrolledToEnd());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
      listenWhen: (previous, current) =>
          previous is StoriesReloading && current is StoriesLoaded,
      listener: (context, state) {
        if (state is StoriesLoaded) {
          _reloadCompleter?.complete();
        }
      },
      buildWhen: (previous, current) => current is! StoriesReloading,
      builder: (context, state) {
        if (state is StoriesLoaded) {
          return _buildPage(
            context,
            state.stories,
            state.hasReachedMax,
          );
        } else if (state is StoriesFirstLoading) {
          return Center(
            child: PLLoading(),
          );
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context,
    List<Story> stories,
    bool hasReachedMax,
  ) {
    final navigateToStoryView = (Story story) {
      Navigator.of(context).pushNamed(
        StoryViewScreen.routeName,
        arguments: StoryViewScreenArgs(story: story),
      );
    };

    final likeStory = (Story story) {
      BlocProvider.of<FeedBloc>(context).add(
        StoryLikeToggled(story),
      );
    };

    final refreshFeed = () async {
      _reloadCompleter = Completer();
      BlocProvider.of<FeedBloc>(context).add(
        FeedReloadRequested(),
      );
      return _reloadCompleter.future;
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
