import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/view/widget/chat_input_form.dart';

final chatMessages = [
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

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // TODO: needs replacement
  List<Message> _messages = chatMessages;

  void _sendMessage(String message) {
    // TODO: needs implementation
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
        backgroundColor: Colors.white,
        title: Text('Charlie Brown'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildChatContent()),
          ChatInputForm(onEnter: _sendMessage),
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
          _buildChatRow(reversedMessages[index]),
    );
  }

  Widget _buildChatRow(Message message) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 12),
      child: message.direction == MessageDirections.Sent
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildChatBubble(message),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildReceivedChatBubble(message),
              ],
            ),
    );
  }

  Widget _buildReceivedChatBubble(Message message) {
    return message.firstInGroup
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black26,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.from,
                    style: const TextStyle(fontSize: 12, color: accentColor),
                  ),
                  SizedBox(height: 5),
                  _buildChatBubble(message),
                ],
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(left: 48),
            child: _buildChatBubble(message),
          );
  }

  Widget _buildChatBubble(Message message) {
    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: message.direction == MessageDirections.Sent
            ? darkSecondaryColor
            : lightSecondaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        message.content,
        maxLines: null,
        style: TextStyle(
          color: message.direction == MessageDirections.Sent
              ? Colors.white
              : accentColor,
        ),
      ),
    );

    final timeText = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: message.showTime
          ? Text(
              DateFormat.jm().format(message.sentDate),
              style: const TextStyle(fontSize: 10, color: darkSecondaryColor),
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
