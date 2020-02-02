import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/src/widget/story_images_page_view.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final Function(Story) onCommentButtonPressed;
  final Function(Story) onLikeButtonPressed;
  final bool displayLikesComments;
  final bool displayActions;

  const StoryItem({
    @required this.story,
    this.onCommentButtonPressed,
    this.onLikeButtonPressed,
    this.displayLikesComments = true,
    this.displayActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _StoryContent(story: story),
        displayLikesComments || displayActions
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  children: <Widget>[
                    displayLikesComments
                        ? _LikeCommentIndicator(
                            like: story.likes,
                            comment: story.comments,
                          )
                        : Container(),
                    Spacer(),
                    displayActions
                        ? _StoryActions(
                            story: story,
                            onCommentPressed: onCommentButtonPressed,
                            onLikePressed: onLikeButtonPressed,
                          )
                        : Container(),
                  ],
                ),
              )
            : Container(),
        Divider(color: darkSecondaryColor),
      ],
    );
  }
}

class _StoryContent extends StatelessWidget {
  final Story story;

  const _StoryContent({@required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: story.profileImageURL == null
                ? AssetImage('res/asset/user_avatar.png')
                : NetworkImage(story.profileImageURL),
          ),
          title: Text(
            story.profileName,
            style: const TextStyle(fontSize: 17.0),
          ),
          subtitle: Text(
            DateFormat('h:mm a, MMM d, y').format(story.created),
            style: TextStyle(fontSize: 12.0, color: darkSecondaryColor),
          ),
        ),
        story.images.isEmpty ? Container() : ImagesPageView(story.images),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            story.content,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Divider(color: darkSecondaryColor),
      ],
    );
  }
}

class _LikeCommentIndicator extends StatelessWidget {
  final int like;
  final int comment;

  const _LikeCommentIndicator({
    this.like = 0,
    this.comment = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          FontAwesomeIcons.solidHeart,
          size: 14,
          color: darkSecondaryColor,
        ),
        Text(
          ' $like    ',
          style: const TextStyle(fontSize: 14, color: darkSecondaryColor),
        ),
        const Icon(
          FontAwesomeIcons.solidComment,
          size: 14,
          color: darkSecondaryColor,
        ),
        Text(
          ' $comment',
          style: const TextStyle(fontSize: 14, color: darkSecondaryColor),
        ),
      ],
    );
  }
}

class _StoryActions extends StatelessWidget {
  final Story story;
  final Function(Story) onCommentPressed;
  final Function(Story) onLikePressed;

  const _StoryActions({
    @required this.story,
    this.onCommentPressed,
    this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (onCommentPressed != null) onCommentPressed(story);
          },
          child: const Icon(
            FontAwesomeIcons.comment,
            size: 28,
            color: darkSecondaryColor,
          ),
        ),
        SizedBox(width: 25),
        GestureDetector(
          onTap: () {
            if (onLikePressed != null) onLikePressed(story);
          },
          child: Icon(
            story.userLiked
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart,
            size: 28,
            color: story.userLiked ? errorColor : darkSecondaryColor,
          ),
        ),
      ],
    );
  }
}
