import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/pet.dart';
import 'package:pawlog/model/story.dart';
import 'package:pawlog/ui/widget/pet_item.dart';
import 'package:pawlog/ui/widget/story_item.dart';

enum ProfileTypes { Self, Other }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.profileType}) : super(key: key);

  final ProfileTypes profileType;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Kate Kim';
  String info = 'Female | 20';
  String intro = 'Hello!\nI’m a dog lover living in Kwun Tong.';
  List<Pet> pets = const [
    Pet(
      'Dexter',
      'Golden Retriever',
      'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Pet(
      'Dexter',
      'Golden Retriever',
      'https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=678&h=381',
    ),
    Pet(
      'Dexter',
      'Golden Retriever',
      'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg',
    ),
  ];
  List<Story> stories = const [Story(), Story(), Story()];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildProfile(),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          _buildFamily(),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          _buildStoryTimeline(),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text, {
    Color color,
    bool outlined = true,
  }) {
    final _color =
        color == null ? Theme.of(context).colorScheme.primary : color;
    return FlatButton(
      onPressed: () => {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: outlined ? _color : Colors.white,
        ),
      ),
      color: outlined ? Colors.transparent : _color,
      splashColor: outlined ? _color.withOpacity(0.15) : Colors.white24,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: outlined ? 1 : 0, color: _color),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: _buildSummary()),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              intro,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          _buildProfileStatus(),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    final col = (String text, int value) => Expanded(
          child: Column(
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
            ],
          ),
        );

    return Row(
      children: <Widget>[
        col('Story', 32),
        col('Follower', 32),
        col('Following', 32),
      ],
    );
  }

  Widget _buildProfileStatus() {
    if (widget.profileType == ProfileTypes.Self) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 30,
      child: 1 == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildButton(
                    'Message',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 90,
                    child: _buildButton(
                      'Friend',
                      color: Theme.of(context).colorScheme.primary,
                      outlined: false,
                    ),
                  ),
                ),
              ],
            )
          : _buildButton(
              'Follow',
              color: Theme.of(context).colorScheme.primary,
            ),
    );
  }

  Widget _buildFamily() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Family',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(FontAwesomeIcons.plus),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (pets.map((Pet pet) => _buildFamilyItem()).toList()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFamilyItem() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PetItem('test', 'test'),
      ),
    );
  }

  Widget _buildStoryTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        widget.profileType == ProfileTypes.Self
            ? FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Create New Story',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                padding: const EdgeInsets.all(15),
              )
            : Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: (stories.map((Story story) => StoryItem(story)).toList()),
        )
      ],
    );
  }
}
