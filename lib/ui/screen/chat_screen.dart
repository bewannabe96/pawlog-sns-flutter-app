import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/widget/chat_input_form.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _timeFormater = DateFormat.jm();

  List<Message> _messages = [
    Message(
      MessageDirections.Received,
      'Test1',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test2',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Received,
      'Test3',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Received,
      'Test4',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test5',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Sent,
      'Test6',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
    Message(
      MessageDirections.Received,
      'Test7',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test8',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Received,
      'Test9',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Received,
      'Test10',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test11',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Sent,
      'Test12',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
    Message(
      MessageDirections.Received,
      'Test13',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test14',
      'Charlie Brown',
      DateTime.now(),
      true,
      true,
    ),
    Message(
      MessageDirections.Received,
      'Test15',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Received,
      'Test16',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
    Message(
      MessageDirections.Sent,
      'Test17',
      'Charlie Brown',
      DateTime.now(),
      true,
      false,
    ),
    Message(
      MessageDirections.Sent,
      'Test18',
      'Charlie Brown',
      DateTime.now(),
      false,
      true,
    ),
  ];

  void _sendMessage(String message) {
    _messages.add(
      Message(
        MessageDirections.Sent,
        message,
        'Charlie Brown',
        DateTime.now(),
        false,
        false,
      ),
    );
    setState(() {
      _messages = _messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Charlie Brown'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: _buildChatContent(),
            ),
          ),
          ChatInputForm(
            onEnter: _sendMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildChatContent() {
    final reversedMessages = _messages.reversed.toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildChatRow(reversedMessages, index),
    );
  }

  Widget _buildChatRow(List<Message> messages, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 10,
      ),
      child: messages[index].direction == MessageDirections.Sent
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildChatBubble(messages[index]),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildReceivedChatBubble(messages[index]),
              ],
            ),
    );
  }

  Widget _buildReceivedChatBubble(Message message) {
    return message.firstInGroup
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black26,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      message.from,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  _buildChatBubble(message),
                ],
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(left: 45),
            child: _buildChatBubble(message),
          );
  }

  Widget _buildChatBubble(Message message) {
    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      decoration: BoxDecoration(
        color: message.direction == MessageDirections.Sent
            ? Theme.of(context).colorScheme.secondaryVariant
            : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        message.content,
        maxLines: null,
      ),
    );

    final timeText = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: message.showTime
          ? Text(
              _timeFormater.format(message.sentDate),
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            )
          : null,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: message.direction == MessageDirections.Sent
          ? <Widget>[timeText, bubble]
          : <Widget>[bubble, timeText],
    );
  }
}
