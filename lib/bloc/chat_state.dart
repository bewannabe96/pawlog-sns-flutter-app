import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class InitialChatState extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatsLoadingState extends ChatState {
  const ChatsLoadingState();

  @override
  List<Object> get props => [];
}

class ChatsLoadedState extends ChatState {
  final List<ChatHeader> chatHeaders;

  const ChatsLoadedState({
    @required this.chatHeaders,
  }) : assert(chatHeaders != null);

  @override
  List<Object> get props => [];
}

class ChatErrorState extends ChatState {
  const ChatErrorState();

  @override
  List<Object> get props => [];
}
