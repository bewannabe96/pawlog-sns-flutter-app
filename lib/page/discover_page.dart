import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  var _pets = {
    1: true,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Who are you with?',
                    style: Theme.of(context).textTheme.display1,
                  )),
              Column(
                children: <Widget>[
                  _buildPetItem(
                      name: 'Coogie',
                      type: 'Dog',
                      breed: 'Beagle',
                      checked: _pets[1],
                      onChanged: (bool newValue) {
                        setState(() {
                          _pets[1] = newValue;
                        });
                      }),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            FontAwesomeIcons.infoCircle,
                            size: Theme.of(context).textTheme.subtitle.fontSize,
                          )),
                      Text(
                        'Important',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  )),
              Text(
                'By starting discover, your location information will be shared'
                ' with other users who are also currently discovering.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: RaisedButton(
                  onPressed: () => {},
                  child: const Text('Start Discover'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPetItem({
    name,
    type,
    breed,
    checked,
    onChanged,
  }) {
    return InkWell(
        onTap: () {
          onChanged(!checked);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: checked,
                onChanged: onChanged,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      '$type ($breed)',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
