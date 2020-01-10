import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/widget/story_item.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

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
      BlocProvider.of<FeedBloc>(context).add(LoadStoriesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (BuildContext context, FeedState state) {
        if (state is StoriesLoadedState) {
          return _buildPage(
            state.stories,
            state.hasReachedMax,
          );
        } else if (state is StoriesLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(List<Story> stories, bool hasReachedMax) {
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

    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return index >= stories.length
            ? PLLoading()
            : StoryItem(stories[index]);
      },
      itemCount: hasReachedMax ? stories.length : stories.length + 1,
    );
  }
}
