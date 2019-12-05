import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import 'package:pawlog/ui/widget/profile/profile.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-profile';

  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ProfileBloc(),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is InitialUserProfileState) {
            BlocProvider.of<UserProfileBloc>(context).add(
              LoadUserProfileEvent(1),
            );
            return Container();
          } else if (state is UserProfileLoadedState) {
            return _buildPage(context, state.profile);
          } else if (state is UserProfileLoadingState) {
            return PLLoading();
          } else {
            return PLError();
          }
        },
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    UserProfile profile,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          profile.name,
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProfileTitle(profile),
            Divider(color: Theme.of(context).colorScheme.secondaryVariant),
            ProfileFamilyList(profile.family),
            Divider(color: Theme.of(context).colorScheme.secondaryVariant),
            ProfileStoryTimeline(profile.stories),
          ],
        ),
      ),
    );
  }
}
