import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatHeadersLoadProgress extends ChatState {}

class ChatHeadersLoadSuccess extends ChatState {
  final List<ChatHeader> messageHeaders;

  const ChatHeadersLoadSuccess({
    @required this.messageHeaders,
  }) : assert(messageHeaders != null);
}

class ChatHeadersLoadFailure extends ChatState {}
