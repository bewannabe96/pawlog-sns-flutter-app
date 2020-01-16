import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/story_images_page_view.dart';

class StoryContent extends StatelessWidget {
  final Story story;

  const StoryContent(this.story);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: story.profileImageURL == null
                    ? AssetImage('res/asset/user_avatar.png')
                    : NetworkImage(story.profileImageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        story.profileName,
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    ),
                    Text(
                      DateFormat('h:mm a, MMM d, y').format(story.created),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Theme.of(context).colorScheme.secondaryVariant,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        story.images.isEmpty ? Container() : StoryImagesPageView(story.images),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            story.content,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.secondaryVariant),
      ],
    );
  }
}
