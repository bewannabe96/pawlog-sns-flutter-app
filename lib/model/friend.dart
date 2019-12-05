import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Friend extends Equatable {
  final int userID;
  final String name;
  final String email;

  const Friend({
    @required this.userID,
    @required this.name,
    @required this.email,
  });

  @override
  List<Object> get props => [userID];
}
