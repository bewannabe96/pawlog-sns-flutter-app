import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './bloc/bloc.dart';

import './user_search_modal.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/screen/home/screen.dart';
import 'package:pawlog/screen/user_profile/screen.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

class FriendPage extends StatelessWidget with HomeScreenPage {
  FriendPage({Key key}) : super(key: key);

  @override
  IconData icon() => FontAwesomeIcons.users;

  @override
  String title(BuildContext context) => 'Friend';

  @override
  List<Widget> actionWidgets(BuildContext context) => <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).push(UserSearchModal()),
          icon: const Icon(FontAwesomeIcons.search),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendBloc, FriendState>(
      builder: (BuildContext context, FriendState state) {
        if (state is FriendsLoadSuccess) {
          return state.friends.length > 0
              ? ListView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  itemCount: state.friends.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildFriendBuild(
                    context,
                    state.friends[index],
                  ),
                )
              : _buildEmptyList(context);
        } else if (state is FriendsLoadProgress) {
          return Center(
            child: PLLoading(),
          );
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildEmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: AssetImage('res/asset/no_friends.png'),
          ),
          Text('No Friends')
        ],
      ),
    );
  }

  Widget _buildFriendBuild(BuildContext context, Friend friend) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        UserProfileScreen.routeName,
        arguments: UserProfileScreenArgs(friend.userID),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.black26,
              backgroundImage: friend.imageURL == null
                  ? AssetImage('res/asset/user_avatar.png')
                  : NetworkImage(friend.imageURL),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    friend.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      friend.email,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black45,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
