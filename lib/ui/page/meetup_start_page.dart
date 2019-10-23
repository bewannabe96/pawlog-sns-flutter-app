import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/pl_checkbox.dart';

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
    _buildConfirmDialog().then((answer) {
      if (answer) {
        Navigator.of(context).pushNamed('/meetup-list');
      }
    });
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
            child: FlatButton(
              onPressed: _startMeetup,
              child: const Text(
                'Start Meetup',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              color: Theme.of(context).colorScheme.primary,
              splashColor: Colors.white24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 13),
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
            PLCheckbox(
              value: checked,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const CircleAvatar(
                radius: 27,
                backgroundColor: Colors.black26,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Text(
                    '$breed',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
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
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
