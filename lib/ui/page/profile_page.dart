import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/pet_item.dart';
import 'package:pawlog/ui/widget/story_item.dart';

enum ProfileTypes { Self, Other }

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key key,
    @required this.profileType,
  }) : super(key: key);

  final ProfileTypes profileType;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is InitialProfileState) {
          BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent(1));
          return Container();
        } else if (state is ProfileLoadedState) {
          return _buildPage(state.profile);
        } else if (state is ProfileLoadingState) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildPage(Profile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildProfile(profile),
        Divider(color: Theme.of(context).colorScheme.secondaryVariant),
        profile.family == null ? _buildNoFamily() : _buildFamily(profile),
        Divider(color: Theme.of(context).colorScheme.secondaryVariant),
        _buildStoryTimeline(profile),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
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

  Widget _buildProfile(Profile profile) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: _buildSummary(profile)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
          profile.intro == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    profile.intro,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
          _buildProfileStatus(),
        ],
      ),
    );
  }

  Widget _buildSummary(Profile profile) {
    final col = (BuildContext context, String text, int value) => Expanded(
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
        col(context, 'Story', profile.story),
        col(context, 'Follower', profile.follower),
        col(context, 'Following', profile.following),
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
                    context,
                    'Message',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 90,
                    child: _buildButton(
                      context,
                      'Friend',
                      color: Theme.of(context).colorScheme.primary,
                      outlined: false,
                    ),
                  ),
                ),
              ],
            )
          : _buildButton(
              context,
              'Follow',
              color: Theme.of(context).colorScheme.primary,
            ),
    );
  }

  Widget _buildNoFamily() {
    return Container();
  }

  Widget _buildFamily(Profile profile) {
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
              children: (profile.family
                  .map((Pet pet) => _buildFamilyItem())
                  .toList()),
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

  Widget _buildStoryTimeline(Profile profile) {
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
        profile.stories.length == 0
            ? Center(
                child: Text('No story exists.'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: (profile.stories
                    .map((Story story) => StoryItem(story))
                    .toList()),
              )
      ],
    );
  }
}
