import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class InitialChatState extends ChatState {}

class ChatHeadersLoading extends ChatState {}

class ChatHeadersLoaded extends ChatState {
  final List<ChatHeader> messageHeaders;

  const ChatHeadersLoaded({
    @required this.messageHeaders,
  }) : assert(messageHeaders != null);
}

class ChatHeadersLoadingFailed extends ChatState {}
