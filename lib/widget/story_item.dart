import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/widget/story_content.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final Function(Story) onCommentButtonPressed;
  final Function(Story) onLikeButtonPressed;

  const StoryItem({
    @required this.story,
    this.onCommentButtonPressed,
    this.onLikeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StoryContent(story),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikeCommentIndicator(
                    like: story.likes, comment: story.comments),
                Row(
                  children: <Widget>[
                    _CommentButton(
                      onTap: () => onCommentButtonPressed(story),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: _LikeButton(
                        story.userLiked,
                        onTap: () => onLikeButtonPressed(story),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
        ],
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final bool liked;
  final Function onTap;

  const _LikeButton(
    this.liked, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: onTap,
      child: Icon(
        liked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        color: liked
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.secondaryVariant,
        size: 28,
      ),
    );

    return button;
  }
}

class _CommentButton extends StatelessWidget {
  final Function onTap;

  const _CommentButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: onTap,
      child: Icon(
        FontAwesomeIcons.comment,
        color: Theme.of(context).colorScheme.secondaryVariant,
        size: 28,
      ),
    );

    return button;
  }
}
