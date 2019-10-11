import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Container(
        width: double.infinity,
        child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey,
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Name',
                                        style:
                                            Theme.of(context).textTheme.body1),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                            'I\'m in front of the bust station',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption))
                                  ],
                                ))),
                        Container(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('PM 4:53',
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ))
                      ],
                    )),
              );
            }));
  }
}
