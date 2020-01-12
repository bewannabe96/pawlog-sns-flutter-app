import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

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
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey,
                backgroundImage: story.profileImageURL == null
                    ? null
                    : NetworkImage(story.profileImageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      story.profileName,
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(
                      story.created,
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
      onTap: () => _navigateToStoryView(context),
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
                  LikeCommentIndicator(
                      like: story.likes, comment: story.comments),
                  Row(
                    children: <Widget>[
                      _CommentButton(
                        onTap: () => _navigateToStoryView(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: _LikeButton(
                          story.userLiked ?? false,
                          onTap: () => _likeStory(context),
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
      ),
    );
  }

  void _navigateToStoryView(BuildContext context) {
    Navigator.of(context).pushNamed(
      StoryViewScreen.routeName,
      arguments: StoryViewScreenArgs(story),
    );
  }

  void _likeStory(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    if (authState is AuthorizedState) {
      BlocProvider.of<FeedBloc>(context).add(
        ToggleStoryLikeEvent(story, authState.user.userID),
      );
    }
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
