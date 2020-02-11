import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/profile_page.dart';

import 'package:pawlog/src/state/app_state.dart';

class ProfilePageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfilePageProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => ProfilePage(props: props),
    );
  }
}

ProfilePageProps _mapStateToProps(Store<AppState> store) {
  return ProfilePageProps(
    profile: store.state.userState.profileState.profile,
    profileLoading: store.state.userState.profileState.loading,
    family: store.state.userState.familyState.family,
    familyLoading: store.state.userState.familyState.loading,
  );
}
