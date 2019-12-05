import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/widget/family_select.dart';

class MeetupStartPage extends StatelessWidget {
  const MeetupStartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Who are you with?',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              BlocBuilder<FamilyBloc, FamilyState>(
                builder: (BuildContext context, FamilyState state) {
                  if (state is FamilyLoadedState) {
                    return FamilySelect(
                      family: state.family,
                      onSubmit: (List<Pet> family) {
                        _startMeetup(context, family);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
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
