import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/screen/create_family_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/family_thunk_action.dart';

class CreateFamilyScreenContainer extends StatelessWidget {
  static const routeName = CreateFamilyScreen.routeName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CreateFamilyScreenProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => CreateFamilyScreen(props: props),
    );
  }
}

CreateFamilyScreenProps _mapStateToProps(Store<AppState> store) {
  return CreateFamilyScreenProps(
    createFamily: (String familyName) =>
        store.dispatch(createFamily(familyName)),
  );
}
