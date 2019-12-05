import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import 'package:pawlog/ui/widget/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoadedState) {
          return _buildPage(
            context,
            state.profile,
            null,
          );
        } else if (state is ProfileLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context,
    Profile profile,
    List<Pet> family,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(profile),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          ProfileFamilyList(family),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          ProfileStoryTimeline(profile.stories),
        ],
      ),
    );
  }
}
