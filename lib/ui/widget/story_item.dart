import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/feed_action_button.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/screen/story_detail_screen.dart';
import 'package:pawlog/ui/widget/story_images_page_view.dart';

class StoryItemContent extends StatelessWidget {
  const StoryItemContent(this.story);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const StoryImagesPageView(
          [
            'https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg',
            'https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=678&h=381',
          ],
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'My kids seem tired…',
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
      onTap: () => Navigator.of(context).pushNamed(StoryDetailScreen.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                            color:
                                Theme.of(context).colorScheme.secondaryVariant,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                  LikeCommentIndicator(like: 32, comment: 2),
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
