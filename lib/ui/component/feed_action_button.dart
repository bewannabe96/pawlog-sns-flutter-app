import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FeedActionButtonTypes {
  Like,
  Comment,
}

class FeedActionButton extends StatelessWidget {
  const FeedActionButton(
    this.type, {
    this.liked = false,
  });

  final FeedActionButtonTypes type;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: () {},
      child: Icon(
        type == FeedActionButtonTypes.Like
            ? liked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart
            : FontAwesomeIcons.comment,
        color: liked
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.secondaryVariant,
        size: 28,
      ),
    );

    return button;
  }
}
