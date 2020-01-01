import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/feed_action_button.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/screen/story/view_screen.dart';
import 'package:pawlog/ui/widget/story_images_page_view.dart';

class StoryItemContent extends StatelessWidget {
  const StoryItemContent(this.story);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Name',
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(
                      '12min ago',
                      style: TextStyle(
                        fontSize: 11,
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

class StoryItem extends StatelessWidget {
  const StoryItem(this.story);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        StoryViewScreen.routeName,
        arguments: StoryViewScreenArgs(story),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StoryItemContent(story),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FeedActionButton(FeedActionButtonTypes.Like, liked: true),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: FeedActionButton(FeedActionButtonTypes.Comment),
                      ),
                    ],
                  ),
                  LikeCommentIndicator(
                      like: story.likes, comment: story.comments),
                ],
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          ],
        ),
      ),
    );
  }
}
