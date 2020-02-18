import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/widget/story_item.dart';
import 'package:pawlog/src/presentation/widget/chat_input_form.dart';
import 'package:pawlog/src/presentation/widget/loading_indicator.dart';

class StoryDetailScreenArgs {
  final Story story;

  const StoryDetailScreenArgs({
    @required this.story,
  });
}

class StoryDetailScreenProps {
  final Story story;
  final List<Comment> comments;
  final bool loading;

  final Function() loadNextComments;
  final Function(String) writeComment;

  const StoryDetailScreenProps({
    @required this.story,
    @required this.comments,
    @required this.loading,
    @required this.loadNextComments,
    @required this.writeComment,
  });
}

class StoryDetailScreen extends StatefulWidget {
  static const routeName = '/story-detail';

  final StoryDetailScreenProps props;

  const StoryDetailScreen({
    Key key,
    @required this.props,
  }) : super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  static const double _scrollThreshold = 100.0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 0 && currentScroll > maxScroll - _scrollThreshold)
      _loadNextComments();
  }

  void _loadNextComments() async {
    widget.props.loadNextComments();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: widget.props.loading
          ? Center(child: LoadingIndicator())
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                StoryItem(story: widget.props.story, displayActions: false),
                _buildComments(),
              ],
            ),
          ),
        ),
        ChatInputForm(onEnter: widget.props.writeComment),
      ],
    );
  }

  Widget _buildComments() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: widget.props.comments
            .map((comment) => _buildCommentItem(context, comment))
            .toList(),
      ),
    );
  }

  Widget _buildCommentItem(BuildContext context, Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: comment.imageURL == null
                  ? const AssetImage('res/asset/user_avatar.png')
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
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: darkSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: lightSecondaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    comment.content,
                    style: const TextStyle(height: 1.3),
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
