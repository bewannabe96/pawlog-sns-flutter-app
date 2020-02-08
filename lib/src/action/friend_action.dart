import 'package:pawlog/src/model/model.dart';

class StartLoadingFriendsListAction {
  @override
  String toString() => 'StartLoadingFriendsListAction';
}

class FinishLoadingFriendsListAction {
  final List<Friend> friends;

  FinishLoadingFriendsListAction({
    this.friends,
  });

  @override
  String toString() =>
      'FinishLoadingFriendsListAction {total: ${friends.length}}';
}
