import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class UserSearchState extends Equatable {
  const UserSearchState();

  @override
  List<Object> get props => [];
}

class UserSearchInitial extends UserSearchState {}

class UserSearchProgress extends UserSearchState {}

class UserSearchSuccess extends UserSearchState {
  final bool found;
  final String queryEmail;
  final UserSearchResult result;

  const UserSearchSuccess({
    @required this.found,
    @required this.queryEmail,
    @required this.result,
  });

  @override
  String toString() => 'UserSearchSuccess [FOUND: $found]';
}

class UserSearchFailure extends UserSearchState {}
