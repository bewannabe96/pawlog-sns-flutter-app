import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import './bloc/bloc.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/widget/story_content.dart';
import 'package:pawlog/widget/chat_input_form.dart';

import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

class StoryViewPage extends StatefulWidget {
  const StoryViewPage({Key key}) : super(key: key);

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      BlocProvider.of<StoryViewBloc>(context).add(ScrolledToEnd());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: BlocBuilder<StoryViewBloc, StoryViewState>(
        builder: (context, state) {
          if (state is StoryLoaded) {
            return _buildContent(context, state.story, state.comments);
          } else if (state is StoryLoading) {
            return Center(
              child: PLLoading(),
            );
          } else {
            return PLError();
          }
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    Story story,
    List<Comment> comments,
  ) {
    final onCommentSubmitted = (String comment) {
      BlocProvider.of<StoryViewBloc>(context).add(
        CommentSubmitted(comment: comment),
      );
    };

    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                StoryContent(story),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: LikeCommentIndicator(
                    like: story.likes,
                    comment: story.comments,
                  ),
                ),
                _buildComments(context, comments),
              ],
            ),
          ),
        ),
        ChatInputForm(
          onEnter: onCommentSubmitted,
        ),
      ],
    );
  }

  Widget _buildComments(BuildContext context, List<Comment> comments) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: comments
            .map((comment) => _buildCommentItem(context, comment))
            .toList(),
      ),
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
              backgroundImage: comment.imageURL == null
                  ? AssetImage('res/asset/user_avatar.png')
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
                        DateFormat('h:mm a, MMM d, y').format(comment.created),
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
