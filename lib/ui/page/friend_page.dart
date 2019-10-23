import 'package:flutter/material.dart';

import 'package:pawlog/ui/screen/profile_screen.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({Key key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  final List<String> friends = const [
    "Test",
    "Test",
    "Test",
    "Test",
    "Test",
    "Test",
    "Test",
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
      itemBuilder: _friendItemBuilder,
    );
  }

  Widget _friendItemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(ProfileScreen.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'This is about my self',
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
