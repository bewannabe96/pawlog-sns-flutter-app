import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/screen/story_view/screen.dart';

import 'package:pawlog/widget/story_item.dart';

class ProfileStoryTimeline extends StatelessWidget {
  final List<Story> stories;
  final bool hasReachedMax;

  const ProfileStoryTimeline({
    Key key,
    @required this.stories,
    @required this.hasReachedMax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigateToStoryView = (Story story) {
      Navigator.of(context).pushNamed(
        StoryViewScreen.routeName,
        arguments: StoryViewScreenArgs(story: story),
      );
    };

    final likeStory = (Story story) {
      // BlocProvider.of<FeedBloc>(context).add(
      //   StoryLikeToggled(story),
      // );
    };

    if (stories.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'No story exists.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          ),
        ),
      );
    }

    return Column(
      children: stories
          .map(
            (story) => StoryItem(
              story: story,
              onCommentButtonPressed: navigateToStoryView,
              onLikeButtonPressed: likeStory,
            ),
          )
          .toList(),
    );
  }
}
