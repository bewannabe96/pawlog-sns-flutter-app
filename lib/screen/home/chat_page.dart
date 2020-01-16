import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/screen/chat_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (BuildContext context, ChatState state) {
        if (state is ChatHeadersLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: state.messageHeaders.length,
            itemBuilder: (BuildContext context, int index) => _buildChatItem(
              context,
              state.messageHeaders[index],
            ),
          );
        } else if (state is ChatHeadersLoading) {
          return Center(
            child: PLLoading(),
          );
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildChatItem(BuildContext context, ChatHeader chat) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black26,
              backgroundImage: chat.userImageURL == null
                  ? null
                  : NetworkImage(chat.userImageURL),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      chat.userName,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        chat.lastMessage,
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
                    chat.lastTime,
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
