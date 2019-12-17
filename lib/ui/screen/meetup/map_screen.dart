import 'package:flutter/material.dart';

import 'package:pawlog/ui/widget/meetup_map.dart';

class MeetupMapScreen extends StatefulWidget {
  static const routeName = '/meetup/map';

  const MeetupMapScreen({Key key}) : super(key: key);

  @override
  _MeetupMapScreenState createState() => _MeetupMapScreenState();
}

class _MeetupMapScreenState extends State<MeetupMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MeetupMap(),
    );
  }
}
