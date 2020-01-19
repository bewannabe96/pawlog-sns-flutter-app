import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserSearchEvent extends Equatable {
  const UserSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchByEmailRequested extends UserSearchEvent {
  final String email;

  const SearchByEmailRequested({
    @required this.email,
  });

  @override
  String toString() => 'SearchByEmailRequested [EMAIL: $email]';
}
