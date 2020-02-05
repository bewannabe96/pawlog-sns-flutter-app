import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/container/widget/story_item.dart';
import 'package:pawlog/src/container/widget/chat_input_form.dart';

class StoryDetailScreenArgs {
  final Story story;

  const StoryDetailScreenArgs({this.story});
}

class StoryDetailScreen extends StatefulWidget {
  static const routeName = '/story-detail';

  final Story story;

  StoryDetailScreen(StoryDetailScreenArgs args, {Key key})
      : story = args.story,
        super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  static const double _scrollThreshold = 100.0;

  final ScrollController _scrollController = ScrollController();

  bool _isLoadingNextComments = false;

  // TODO: needs replacement
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialComments();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 0 && currentScroll > maxScroll - _scrollThreshold)
      _loadNextComments();
  }

  void _loadInitialComments() async {
    // TODO: needs implementation
    var jsonstring =
        await rootBundle.loadString('res/sample/story-comments.json');
    final json = jsonDecode(jsonstring);

    final entities = (json['comments'] as List)
        .map((j) => CommentEntity.fromJson(j))
        .toList();
    final comments =
        entities.map((entity) => Comment.fromEntity(entity)).toList();

    setState(() {
      _comments = comments;
    });
  }

  void _loadNextComments() async {
    if (_isLoadingNextComments) return;
    _isLoadingNextComments = true;
    // TODO: needs implementation
    print('load next comments');
    await Future.delayed(Duration(seconds: 3));
    print('load completed');
    _isLoadingNextComments = false;
  }

  void _writeComment(String comment) {
    // TODO: needs implementation
    print('write comment: $comment');
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
      body: _buildContent(context, _comments),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<Comment> comments,
  ) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                StoryItem(story: widget.story, displayActions: false),
                _buildComments(context, comments),
              ],
            ),
          ),
        ),
        ChatInputForm(onEnter: _writeComment),
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
