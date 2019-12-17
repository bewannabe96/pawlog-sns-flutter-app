import 'package:pawlog/model/model.dart';

class Profile {
  String intro;

  int story;
  int follower;
  int following;

  List<Story> stories;

  Profile({
    this.intro,
    this.story = 0,
    this.follower = 0,
    this.following = 0,
    this.stories = const [],
  });
}

class UserProfile extends Profile {
  String name;
  String profileURL;

  Family family;

  UserProfile({
    this.name = '',
    this.profileURL = '',
    this.family,
  }) : super();
}
