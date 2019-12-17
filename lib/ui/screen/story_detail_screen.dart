import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/chat_input_form.dart';
import 'package:pawlog/ui/component/like_comment_indicator.dart';
import 'package:pawlog/ui/widget/story_item.dart';

class StoryDetailScreenArgs {
  final Story story;

  const StoryDetailScreenArgs(this.story);
}

class StoryDetailScreen extends StatelessWidget {
  static const routeName = '/story-view';

  final Story story;

  const StoryDetailScreen(this.story, {Key key}) : super(key: key);

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
