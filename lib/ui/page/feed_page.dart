import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/story_item.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<String> friends = const [
    "Test",
    "Test",
    "Test",
    "Test",
    "Test",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      itemCount: friends.length,
      itemBuilder: (BuildContext context, int index) => StoryItem(Story()),
    );
  }
}
