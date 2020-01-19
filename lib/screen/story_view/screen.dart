import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/screen/story_view/page.dart';

class StoryViewScreenArgs {
  final Story story;

  const StoryViewScreenArgs({this.story});
}

class StoryViewScreen extends StatelessWidget {
  static const routeName = '/story/view';

  final Story story;

  StoryViewScreen(
    StoryViewScreenArgs args, {
    Key key,
  })  : story = args.story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoryViewBloc>(
      create: (context) => StoryViewBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        // feedBloc: BlocProvider.of<FeedBloc>(context),
      )..add(StoryViewScreenLoaded(story: story)),
      child: StoryViewPage(),
    );
  }
}
