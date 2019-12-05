import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/story_timeline.dart';

class ProfileStoryTimeline extends StatelessWidget {
  final bool addNewStoryButton;

  final List<Story> stories;

  const ProfileStoryTimeline(
    this.stories, {
    Key key,
    this.addNewStoryButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        addNewStoryButton
            ? FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Create New Story',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                padding: const EdgeInsets.all(15),
              )
            : Container(),
        StoryTimeline(stories),
      ],
    );
  }
}
