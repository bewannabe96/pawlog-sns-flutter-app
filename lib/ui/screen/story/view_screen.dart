import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/chat_input_form.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/widget/story_item.dart';

class StoryViewScreenArgs {
  final Story story;

  const StoryViewScreenArgs(this.story);
}

class StoryViewScreen extends StatelessWidget {
  static const routeName = '/story/view';

  final Story story;

  const StoryViewScreen(this.story, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  StoryItemContent(story),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: LikeCommentIndicator(
                      like: story.likes,
                      comment: story.comments,
                    ),
                  ),
                  _buildComments(context),
                ],
              ),
            ),
          ),
          ChatInputForm(
            onEnter: (String comment) => _onEnter(context, comment),
          ),
        ],
      ),
    );
  }

  void _onEnter(BuildContext context, String comment) {
    final authState = BlocProvider.of<AuthBloc>(context).state;

    if (authState is AuthorizedState) {
      BlocProvider.of<StoryCommentsBloc>(context).add(
        WriteCommentEvent(story, authState.user.userID, comment),
      );
    }
  }

  Widget _buildComments(BuildContext context) {
    return BlocBuilder<StoryCommentsBloc, StoryCommentsState>(
      builder: (context, state) {
        if (state is CommentsLoadedState) {
          return _buildCommentsList(context, state.comments);
        } else if (state is CommentsLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildCommentsList(BuildContext context, List<Comment> comments) {
    return Column(
      children: comments
          .map((comment) => _buildCommentItem(context, comment))
          .toList(),
    );
  }

  Widget _buildCommentItem(BuildContext context, Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black26,
              backgroundImage: comment.imageURL == null
                  ? null
                  : NetworkImage(comment.imageURL),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          comment.name,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Text(
                        comment.created,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    comment.content,
                    style: const TextStyle(
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
