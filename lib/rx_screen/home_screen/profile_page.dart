// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import './bloc/bloc.dart';

// import 'package:pawlog/bloc/bloc.dart';
// import 'package:pawlog/model/model.dart';

// import 'package:pawlog/screen/home/screen.dart';
// import 'package:pawlog/screen/story_view/screen.dart';

// import 'package:pawlog/widget/story_item.dart';
// import 'package:pawlog/widget/profile_title.dart';
// import 'package:pawlog/widget/profile_family_list.dart';

// import 'package:pawlog/ui/screen/story/new_story_screen.dart';
// import 'package:pawlog/ui/screen/settings/settings_screen.dart';
// import 'package:pawlog/ui/component/pl_error.dart';
// import 'package:pawlog/ui/component/pl_loading.dart';

// class ProfilePage extends StatelessWidget with HomeScreenPage {
//   ProfilePage({Key key}) : super(key: key);

//   @override
//   IconData icon() => FontAwesomeIcons.solidUserCircle;

//   @override
//   String title(BuildContext context) {
//     final authState = BlocProvider.of<AuthenticationBloc>(context).state;
//     return authState is Authenticated ? authState.user.name : '';
//   }

//   @override
//   List<Widget> actionWidgets(BuildContext context) => <Widget>[
//         IconButton(
//           onPressed: () =>
//               Navigator.of(context).pushNamed(NewStoryScreen.routeName),
//           icon: const Icon(FontAwesomeIcons.solidEdit),
//         ),
//         IconButton(
//           onPressed: () =>
//               Navigator.of(context).pushNamed(SettingsScreen.routeName),
//           icon: const Icon(FontAwesomeIcons.cog),
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileBloc, ProfileState>(
//       builder: (BuildContext context, ProfileState state) {
//         if (state is ProfileLoadSuccess) {
//           return _buildPage(context, state.profile, state.stories);
//         } else if (state is ProfileLoadProgress) {
//           return Center(
//             child: PLLoading(),
//           );
//         } else {
//           return PLError();
//         }
//       },
//     );
//   }

//   Widget _buildPage(
//     BuildContext context,
//     Profile profile,
//     List<Story> stories,
//   ) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           ProfileTitle(profile),
//           Divider(),
//           _buildFamilyList(),
//           Divider(),
//           _buildStoryTimeline(context, stories),
//         ],
//       ),
//     );
//   }

//   Widget _buildFamilyList() {
//     return BlocBuilder<FamilyBloc, FamilyState>(
//       builder: (BuildContext context, FamilyState state) {
//         if (state is FamilyLoadedState) {
//           if (state.family == null) {
//             return FlatButton(
//               onPressed: () {},
//               child: Text(
//                 "New Family",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               textColor: Theme.of(context).colorScheme.primary,
//             );
//           } else {
//             return ProfileFamilyList(family: state.family);
//           }
//         } else if (state is FamilyLoadingState) {
//           return PLLoading();
//         } else {
//           return PLError();
//         }
//       },
//     );
//   }

//   Widget _buildStoryTimeline(
//     BuildContext context,
//     List<Story> stories,
//   ) {
//     final navigateToStoryView = (Story story) {
//       Navigator.of(context).pushNamed(
//         StoryViewScreen.routeName,
//         arguments: StoryViewScreenArgs(story: story),
//       );
//     };

//     final likeStory = (Story story) {
//       // BlocProvider.of<FeedBloc>(context).add(
//       //   StoryLikeToggled(story),
//       // );
//     };

//     if (stories.isEmpty) {
//       return Center(
//         child: Text(
//           'No story exists.',
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.secondaryVariant,
//           ),
//         ),
//       );
//     }

//     return Column(
//       children: stories
//           .map(
//             (story) => StoryItem(
//               story: story,
//               onCommentButtonPressed: navigateToStoryView,
//               onLikeButtonPressed: likeStory,
//             ),
//           )
//           .toList(),
//     );
//   }
// }
