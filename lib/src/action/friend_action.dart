import 'package:pawlog/src/model/model.dart';

class StartLoadingFriendsAction {
  @override
  String toString() => 'StartLoadingFriendsAction';
}

class UpdateFriendsAction {
  final List<Friend> friends;

  UpdateFriendsAction(this.friends);

  @override
  String toString() => 'UpdateFriendsAction {total: ${friends.length}}';
}

class ThrowFriendsErrorAction {
  String error;

  ThrowFriendsErrorAction(this.error);

  @override
  String toString() => 'ThrowFriendsErrorAction {$error}';
}
