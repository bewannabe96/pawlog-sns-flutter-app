import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:pawlog/ui/screen/chat_screen.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> _messages = const <String>[
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
      padding: const EdgeInsets.only(bottom: 10),
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) => _buildChatItem(),
    );
  }

  Widget _buildChatItem() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black26,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Name',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        'I\'m in front of the bust station',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'PM 4:53',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
