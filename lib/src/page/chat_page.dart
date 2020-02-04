import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/screen/home_screen.dart';
import 'package:pawlog/src/screen/chat_screen.dart';

class ChatPage extends StatefulWidget with HomeScreenPage {
  ChatPage({Key key}) : super(key: key);

  @override
  IconData icon() => FontAwesomeIcons.solidComments;

  @override
  String title(BuildContext context) => 'Chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // TODO: needs replacement
  List<ChatHeader> _chatHeaders = [];

  @override
  void initState() {
    super.initState();
    _loadInitialChatHeaders();
  }

  void _loadInitialChatHeaders() async {
    // TODO: needs implementation
    var jsonstring = await rootBundle.loadString('res/sample/chats.json');
    final json = jsonDecode(jsonstring);

    final entities = (json['chatheaders'] as List)
        .map((j) => ChatHeaderEntity.fromJson(j))
        .toList();
    final chatHeaders =
        entities.map((entity) => ChatHeader.fromEntity(entity)).toList();

    setState(() {
      _chatHeaders = chatHeaders;
    });
  }

  void _navigateToChat() {
    Navigator.of(context).pushNamed(ChatScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 10),
      itemCount: _chatHeaders.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildChatItem(context, _chatHeaders[index]),
    );
  }

  Widget _buildChatItem(BuildContext context, ChatHeader chat) {
    return InkWell(
      onTap: _navigateToChat,
      child: ListTile(
        leading: CircleAvatar(
          radius: 27.0,
          backgroundColor: lightSecondaryColor,
          backgroundImage: chat.userImageURL == null
              ? const AssetImage('res/asset/user_avatar.png')
              : NetworkImage(chat.userImageURL),
        ),
        title: Text(
          chat.userName,
          style: const TextStyle(fontSize: 15.0),
        ),
        subtitle: Text(
          chat.lastMessage,
          style: const TextStyle(fontSize: 13, color: Colors.black45),
        ),
        trailing: Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                chat.lastTime,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
