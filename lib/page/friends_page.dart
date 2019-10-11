import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<String> _friends = const <String>[
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
    return Container(
        width: double.infinity,
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: _friends.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
                                Text('Name',
                                    style: Theme.of(context).textTheme.body1),
                                Text('Pet | Pet',
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ))
                      ],
                    )),
              );
            }));
  }
}
