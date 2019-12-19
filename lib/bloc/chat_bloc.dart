import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  @override
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is LoadChatsEvent) {
      yield* loadChats(event);
    }
  }

  Stream<ChatState> loadChats(LoadChatsEvent event) async* {
    yield ChatsLoadingState();
    try {
      final chats = await UserRepository.fetchChats(event.userID);
      yield ChatsLoadedState(chats: chats);
    } catch (_) {
      yield ChatErrorState();
    }
  }
}