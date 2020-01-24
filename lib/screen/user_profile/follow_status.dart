import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/screen/user_profile/follow_action_modal.dart';

import './bloc/bloc.dart';

import 'package:pawlog/ui/screen/chat_screen.dart';

class FollowStatus extends StatelessWidget {
  const FollowStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserFollowBloc, UserFollowState>(
      listener: (context, state) {
        if (state is UserFollowActionSuccess) {
          BlocProvider.of<FriendBloc>(context).add(
            FriendUpdated(
              friend: state.friend,
              add: state.follow,
            ),
          );
          BlocProvider.of<UserProfileBloc>(context).add(
            UserFollowStatusChanged(
              follow: state.follow,
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        height: 32.0,
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoadSuccess &&
                state.profile.isFollowing != -1) {
              return _buildFollowing(context);
            } else {
              return _buildNotFollowing(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildFollowing(BuildContext context) {
    final onMessagePressed = () {
      Navigator.of(context).pushNamed(ChatScreen.routeName);
    };

    final onUnfollowPressed = () async {
      switch (await Navigator.of(context).push(FollowActionModal())) {
        case 1:
          final userProfileState =
              BlocProvider.of<UserProfileBloc>(context).state;
          if (userProfileState is UserProfileLoadSuccess) {
            BlocProvider.of<UserFollowBloc>(context).add(
              UserFollowRequested(
                targetUserID: userProfileState.profile.userID,
                follow: false,
              ),
            );
          }
          break;
      }
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _FollowButton(
            text: 'Message',
            onPressed: onMessagePressed,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 100,
            child: _FollowButton(
              text: 'Following',
              onPressed: onUnfollowPressed,
              color: Theme.of(context).colorScheme.primary,
              outlined: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotFollowing(BuildContext context) {
    final onFollowPressed = () {
      final userProfileState = BlocProvider.of<UserProfileBloc>(context).state;
      if (userProfileState is UserProfileLoadSuccess) {
        BlocProvider.of<UserFollowBloc>(context).add(
          UserFollowRequested(
            targetUserID: userProfileState.profile.userID,
            follow: true,
          ),
        );
      }
    };

    return _FollowButton(
      text: 'Follow',
      onPressed: onFollowPressed,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class _FollowButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final bool outlined;

  const _FollowButton({
    @required this.text,
    @required this.onPressed,
    this.color,
    this.outlined = true,
  });

  @override
  Widget build(BuildContext context) {
    final _color =
        color == null ? Theme.of(context).colorScheme.primary : color;

    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5,
          color: outlined ? _color : Colors.white,
        ),
      ),
      color: outlined ? Colors.transparent : _color,
      splashColor: outlined ? _color.withOpacity(0.15) : Colors.white24,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: outlined ? 1.0 : 0, color: _color),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
