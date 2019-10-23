import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeCommentIndicator extends StatelessWidget {
  const LikeCommentIndicator({
    this.like = 0,
    this.comment = 0,
  });

  final int like;
  final int comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            FontAwesomeIcons.solidHeart,
            size: 13,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
        Text(
          '$like',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 15),
          child: Icon(
            FontAwesomeIcons.solidComment,
            size: 13,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
        Text(
          '$comment',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      ],
    );
  }
}
