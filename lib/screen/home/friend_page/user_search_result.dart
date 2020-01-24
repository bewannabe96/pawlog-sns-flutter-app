import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/screen/user_profile/screen.dart';

import 'package:pawlog/ui/component/pl_loading.dart';

class UserSearchResultArea extends StatelessWidget {
  const UserSearchResultArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSearchBloc, UserSearchState>(
      builder: (context, state) {
        if (state is UserSearchSuccess) {
          return _buildResult(
            context,
            state.found,
            state.queryEmail,
            state.result,
          );
        } else if (state is UserSearchProgress) {
          return PLLoading();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildResult(
    BuildContext context,
    bool found,
    String queryEmail,
    UserSearchResult result,
  ) {
    return found
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundImage: result.imageURL == null
                    ? AssetImage('res/asset/user_avatar.png')
                    : NetworkImage(result.imageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  result.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                child: Text(
                  queryEmail,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  UserProfileScreen.routeName,
                  arguments: UserProfileScreenArgs(
                    userID: result.userID,
                  ),
                ),
                color: Theme.of(context).colorScheme.primary,
                splashColor: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'View Profile',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : Text(
            'User not found.',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.0,
            ),
          );
  }
}
