import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/presentation/screen/story_detail_screen.dart';

import 'package:pawlog/src/presentation/widget/story_item.dart';

class ProfileStoryTimeline extends StatelessWidget {
  final List<Story> stories;
  final bool hasReachedMax;

  final Function(Story) onLikeButtonPressed;

  const ProfileStoryTimeline({
    Key key,
    @required this.stories,
    @required this.hasReachedMax,
    this.onLikeButtonPressed,
  }) : super(key: key);

  void _navigateToStoryDetail(BuildContext context, Story story) {
    Navigator.of(context).pushNamed(
      StoryDetailScreen.routeName,
      arguments: StoryDetailScreenArgs(story: story),
    );
  }

  void _onLikePressed(Story story) {
    if (onLikeButtonPressed != null) onLikeButtonPressed(story);
  }

  @override
  Widget build(BuildContext context) {
    return stories.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'No story exists.',
                style: const TextStyle(color: darkSecondaryColor),
              ),
            ),
          )
        : Column(
            children: stories
                .map(
                  (story) => StoryItem(
                    story: story,
                    onCommentButtonPressed: (story) =>
                        _navigateToStoryDetail(context, story),
                    onLikeButtonPressed: _onLikePressed,
                  ),
                )
                .toList(),
          );
  }
}
