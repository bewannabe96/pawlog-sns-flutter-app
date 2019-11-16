import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/chat_input_form.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/widget/story_item.dart';

class StoryDetailScreen extends StatefulWidget {
  static const routeName = '/story-view';

  const StoryDetailScreen({Key key}) : super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
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
                  StoryItemContent(Story()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        LikeCommentIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ChatInputForm(),
        ],
      ),
    );
  }
}
