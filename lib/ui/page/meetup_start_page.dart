import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/pl_checkbox.dart';
import 'package:pawlog/ui/component/pl_primary_action_button.dart';
import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/widget/pet_item.dart';

class MeetupStartPage extends StatefulWidget {
  const MeetupStartPage({Key key}) : super(key: key);

  @override
  _MeetupStartPageState createState() => _MeetupStartPageState();
}

class _MeetupStartPageState extends State<MeetupStartPage> {
  var _pets = {
    1: false,
    2: false,
    3: false,
  };

  void _startMeetup() {
    _buildConfirmDialog().then(
      (bool answer) {
        if (answer) {
          print(Navigator.of(context));
          Navigator.of(context).pushNamed(MeetupListScreen.routeName);
        }
      },
    );
  }

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
              Column(
                children: <Widget>[
                  _buildPetItem(
                    name: 'Coogie',
                    breed: 'Beagle',
                    checked: _pets[1],
                    onChanged: (bool newValue) {
                      setState(
                        () {
                          _pets[1] = newValue;
                        },
                      );
                    },
                  ),
                  _buildPetItem(
                    name: 'Coogie',
                    breed: 'Beagle',
                    checked: _pets[2],
                    onChanged: (bool newValue) {
                      setState(
                        () {
                          _pets[2] = newValue;
                        },
                      );
                    },
                  ),
                  _buildPetItem(
                    name: 'Coogie',
                    breed: 'Beagle',
                    checked: _pets[3],
                    onChanged: (bool newValue) {
                      setState(
                        () {
                          _pets[3] = newValue;
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: PLPrimaryActionButton(
              title: 'Start Meetup',
              onPressed: _startMeetup,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetItem({
    name,
    breed,
    checked,
    onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged(!checked);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PLCheckbox(
                value: checked,
              ),
            ),
            Expanded(
              child: PetItem(name, breed),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _buildConfirmDialog() {
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
