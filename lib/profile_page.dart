import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Sookhyun Kwon',
                                style: Theme.of(context).textTheme.title),
                            Text('Male | 23',
                                style: Theme.of(context).textTheme.subtitle),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    'Hello!\nI am a developer from South Korea.',
                                    style: Theme.of(context).textTheme.caption))
                          ],
                        )),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Pets', style: Theme.of(context).textTheme.headline),
                    Container(
                        height: 120,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[200]),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(5))),
                        child: PageIndicatorContainer(
                          child: PageView(
                            children: <Widget>[
                              _buildPetItem(),
                              _buildPetItem(),
                              _buildPetItem(),
                            ],
                          ),
                          length: 3,
                          shape: IndicatorShape.circle(size: 7),
                          indicatorColor: Colors.grey[200],
                        ))
                  ],
                ))
          ],
        ));
  }

  Widget _buildPetItem() {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name', style: Theme.of(context).textTheme.body1),
                    Text('Pet | Pet',
                        style: Theme.of(context).textTheme.caption)
                  ],
                ))
          ],
        ));
  }
}
