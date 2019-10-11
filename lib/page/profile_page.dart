import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

enum ProfileTypes { Self, Other }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.profileType}) : super(key: key);

  final ProfileTypes profileType;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Sookhyun Kwon';
  String _info = 'Male | 23';
  String _intro = 'Hello!\nI am a developer from South Korea.';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(_name,
                                    style: Theme.of(context).textTheme.title),
                                Text(_info,
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                                Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(_intro,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption))
                              ],
                            )),
                        const CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                    _buildProfileStatus(),
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

  Widget _buildProfileStatus() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 30,
      child: widget.profileType == ProfileTypes.Self
          ? FlatButton(
              onPressed: () => {},
              child: Text(
                "Edit Profile",
                style: Theme.of(context).textTheme.caption,
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
            )
          : (1 == 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () => {},
                          child: Text(
                            "Message",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 90,
                        child: FlatButton(
                          color: Colors.grey,
                          onPressed: () => {},
                          child: Text(
                            "Friend",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                )
              : FlatButton(
                  onPressed: () => {},
                  child: Text(
                    "Request Friend",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                )),
    );
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
