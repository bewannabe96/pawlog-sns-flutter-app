import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class ProfileEntity {
  final int userid;
  final String email;
  final String name;
  final String imageurl;
  final String intro;

  final int stories;
  final int followers;
  final int followings;

  final int isfollowing;

  const ProfileEntity({
    this.userid,
    this.email,
    this.name,
    this.imageurl,
    this.intro,
    this.stories,
    this.followers,
    this.followings,
    this.isfollowing,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
}
