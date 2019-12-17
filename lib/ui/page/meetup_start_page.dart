import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/modal/new_family_modal.dart';
import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/widget/family_select.dart';

class MeetupStartPage extends StatelessWidget {
  const MeetupStartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (BuildContext context, FamilyState state) {
        if (state is FamilyLoadedState) {
          if (!(state.family is Family)) {
            return _buildNoFamily(context);
          } else if (state.family.pets.length > 0)
            return _buildPage(context, state.family.pets);
          else
            return _buildNoFamily(context);
        } else if (state is FamilyLoadedState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildNoFamily(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: AssetImage('res/asset/no_pet.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: PLFilledButton(
              title: 'Organize family',
              onPressed: () => Navigator.of(context).push(NewFamilyModal()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, List<Pet> family) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Who are you with?',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          FamilySelect(
            family: family,
            onSubmit: (List<Pet> family) {
              _startMeetup(context, family);
            },
          ),
        ],
      ),
    );
  }

  void _startMeetup(BuildContext context, List<Pet> family) async {
    if (await _buildConfirmDialog(context)) {
      Navigator.of(context).pushNamed(MeetupListScreen.routeName);
    }
  }

  Future<bool> _buildConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Caution'),
          content: const Text(
            'Your location information will be shared.',
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                'Cancel',
                style: const TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
