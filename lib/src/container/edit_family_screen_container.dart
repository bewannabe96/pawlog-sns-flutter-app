import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/view/screen/edit_family_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

class EditFamilyScreenContainer extends StatelessWidget {
  static const routeName = EditFamilyScreen.routeName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EditFamilyScreenProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => EditFamilyScreen(props: props),
    );
  }
}

EditFamilyScreenProps _mapStateToProps(Store<AppState> store) {
  return EditFamilyScreenProps(
    family: store.state.familyState.family,
  );
}
