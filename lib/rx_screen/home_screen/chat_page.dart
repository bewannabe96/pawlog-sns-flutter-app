// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import './bloc/bloc.dart';

// import 'package:pawlog/model/model.dart';

// import 'package:pawlog/screen/home/screen.dart';

// import 'package:pawlog/ui/component/pl_error.dart';
// import 'package:pawlog/ui/component/pl_loading.dart';
// import 'package:pawlog/ui/screen/chat_screen.dart';

// class ChatPage extends StatelessWidget with HomeScreenPage {
//   ChatPage({Key key}) : super(key: key);

//   @override
//   IconData icon() => FontAwesomeIcons.solidComments;

//   @override
//   String title(BuildContext context) => 'Chat';

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatBloc, ChatState>(
//       builder: (BuildContext context, ChatState state) {
//         if (state is ChatHeadersLoadSuccess) {
//           return ListView.builder(
//             padding: const EdgeInsets.only(bottom: 10),
//             itemCount: state.messageHeaders.length,
//             itemBuilder: (BuildContext context, int index) => _buildChatItem(
//               context,
//               state.messageHeaders[index],
//             ),
//           );
//         } else if (state is ChatHeadersLoadProgress) {
//           return Center(
//             child: PLLoading(),
//           );
//         } else {
//           return PLError();
//         }
//       },
//     );
//   }

//   Widget _buildChatItem(BuildContext context, ChatHeader chat) {
//     return ListTile(
//       onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
//       leading: CircleAvatar(
//         radius: 25,
//         backgroundColor: Colors.black26,
//         backgroundImage:
//             chat.userImageURL == null ? null : NetworkImage(chat.userImageURL),
//       ),
//       title: Text(
//         chat.userName,
//         style: const TextStyle(
//           fontSize: 15,
//         ),
//       ),
//       subtitle: Text(
//         chat.lastMessage,
//         style: TextStyle(
//           fontSize: 13,
//           color: Colors.grey[500],
//         ),
//       ),
//       trailing: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Text(
//               chat.lastTime,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
