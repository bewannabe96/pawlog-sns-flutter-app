import 'package:pawlog/model/model.dart';

class Profile {
  String intro;

  int story;
  int follower;
  int following;

  List<Story> stories;

  Profile({
    this.intro = '',
    this.story = 0,
    this.follower = 0,
    this.following = 0,
    this.stories = const [],
  });
}

class UserProfile extends Profile {
  String name;
  String profileURL;

  List<Pet> family;

  UserProfile({
    this.name = '',
    this.profileURL = '',
    this.family,
  }) : super();

  factory UserProfile.fromJSON(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      profileURL: json['imageurl'],
      // intro: json['intro'],
      // story: json['stories'],
      // follower: json['followers'],
      // following: json['followings'],
      family: json['family'],
    );
  }
}
