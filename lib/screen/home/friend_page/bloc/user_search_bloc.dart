import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/user.dart';

import './bloc.dart';

class UserSearchBloc extends Bloc<UserSearchEvent, UserSearchState> {
  @override
  UserSearchState get initialState => UserSearchInitial();

  @override
  Stream<UserSearchState> mapEventToState(
    UserSearchEvent event,
  ) async* {
    if (event is SearchByEmailRequested) {
      yield* _mapSearchByEmailRequestedToState(event);
    }
  }

  Stream<UserSearchState> _mapSearchByEmailRequestedToState(
    SearchByEmailRequested event,
  ) async* {
    yield UserSearchProgress();
    try {
      final result = await UserRepository.searchUserByEmail(event.email);
      yield UserSearchSuccess(
        found: result != null,
        queryEmail: event.email,
        result: result,
      );
    } catch (e) {
      yield UserSearchFailure();
    }
  }
}
