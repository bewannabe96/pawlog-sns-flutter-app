import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/story_timeline.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> stories = const [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoryTimeline(stories),
    );
  }
}
