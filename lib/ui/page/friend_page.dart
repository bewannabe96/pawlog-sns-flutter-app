import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/screen/user_profile_screen.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendBloc, FriendState>(
      builder: (BuildContext context, FriendState state) {
        if (state is FriendsLoadedState) {
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: state.friends.length,
            itemBuilder: (BuildContext context, int index) =>
                _friendItemBuilder(
              context,
              state.friends[index],
            ),
          );
        } else if (state is FriendsLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _friendItemBuilder(BuildContext context, Friend friend) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        UserProfileScreen.routeName,
        arguments: UserProfileScreenArgs(friend.userID),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    friend.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    friend.email,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
