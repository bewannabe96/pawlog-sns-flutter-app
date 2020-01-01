import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class Profile extends Equatable {
  final String email;
  final String name;
  final String imageURL;
  final String intro;

  final int stories;
  final int followers;
  final int followings;

  Profile._({
    @required this.email,
    @required this.name,
    this.imageURL,
    this.intro,
    this.stories,
    this.followers,
    this.followings,
  });

  @override
  List<Object> get props => [email];

  factory Profile.fromEntity(ProfileEntity entity) {
    return Profile._(
      email: entity.email,
      name: entity.name,
      imageURL: entity.imageURL,
      intro: entity.intro,
      stories: entity.stories,
      followers: entity.followers,
      followings: entity.followings,
    );
  }
}
