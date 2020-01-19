import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/repository/repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final AuthenticationBloc _authenticationBloc;

  ChatBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is ChatPageLoaded) {
      yield* _mapChatPageLoadedToState(event);
    }
  }

  Stream<ChatState> _mapChatPageLoadedToState(
    ChatPageLoaded event,
  ) async* {
    final authState = _authenticationBloc.state;

    if (authState is Authenticated) {
      yield ChatHeadersLoading();
      try {
        final messageHeaders = await UserRepository.fetchChatHeaders(
          authState.user.userID,
        );
        yield ChatHeadersLoaded(messageHeaders: messageHeaders);
      } catch (e) {
        yield ChatHeadersLoadingFailed();
      }
    }
  }
}
