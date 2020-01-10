import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class InitialChatState extends ChatState {}

class ChatsLoadingState extends ChatState {
  const ChatsLoadingState();
}

class ChatsLoadedState extends ChatState {
  final List<ChatHeader> chatHeaders;

  const ChatsLoadedState({
    @required this.chatHeaders,
  }) : assert(chatHeaders != null);
}

class ChatErrorState extends ChatState {
  const ChatErrorState();
}
