import 'package:equatable/equatable.dart';

import 'package:pawlog/model/pet.dart';
import 'package:pawlog/model/story.dart';

class Profile extends Equatable {
  final String profileURL;
  final String email;
  final String name;
  final String intro;

  final int story;
  final int follower;
  final int following;

  final List<Pet> family;
  final List<Story> stories;

  Profile({
    this.profileURL,
    this.email,
    this.name,
    this.intro,
    this.story = 0,
    this.follower = 0,
    this.following = 0,
    this.family,
    this.stories = const [],
  });

  @override
  List<Object> get props => [email];

  static Profile fromJSON(dynamic json) {
    return Profile(
      profileURL: json['imageurl'],
      intro: json['intro'],
      family: json['family'],
      story: json['stories'],
      follower: json['followers'],
      following: json['followings'],
    );
  }
}
