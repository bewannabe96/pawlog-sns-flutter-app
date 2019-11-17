import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import 'package:pawlog/ui/widget/family_list.dart';
import 'package:pawlog/ui/widget/story_timeline.dart';

enum ProfileTypes { Self, Other }

class ProfilePage extends StatefulWidget {
  final ProfileTypes profileType;
  final int userID;

  ProfilePage({
    Key key,
    @required this.profileType,
    @required this.userID,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is InitialProfileState) {
          BlocProvider.of<ProfileBloc>(context).add(
            LoadProfileEvent(widget.userID),
          );
          return Container();
        } else if (state is ProfileLoadedState) {
          return _buildPage(state.profile, state.stories);
        } else if (state is ProfileLoadingState) {
          return PLLoading();
        } else {
          // ProfileErrorState and else
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(Profile profile, List<Story> stories) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildProfile(profile),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          FamilyList(profile.family),
          Divider(color: Theme.of(context).colorScheme.secondaryVariant),
          _buildStoryTimeline(stories),
        ],
      ),
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

  Widget _buildStoryTimeline(List<Story> stories) {
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
        StoryTimeline(stories),
      ],
    );
  }
}
