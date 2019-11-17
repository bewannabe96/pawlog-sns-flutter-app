import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/story_item.dart';

class StoryTimeline extends StatelessWidget {
  final List<Story> stories;

  const StoryTimeline(this.stories);

  @override
  Widget build(BuildContext context) {
    return stories.length == 0
        ? Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'No story exists.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: (stories.map((Story story) => StoryItem(story)).toList()),
          );
  }
}
