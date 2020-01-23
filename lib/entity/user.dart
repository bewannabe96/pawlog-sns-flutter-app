import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserEntity {
  final int userid;
  final String email;
  final String name;
  final String imageurl;
  final String intro;

  const UserEntity({
    this.userid,
    this.email,
    this.name,
    this.imageurl,
    this.intro,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class UserSearchResultEntity {
  final int userid;
  final String imageurl;
  final String name;
  final String intro;

  const UserSearchResultEntity({
    this.userid,
    this.imageurl,
    this.name,
    this.intro,
  });

  factory UserSearchResultEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSearchResultEntityFromJson(json);
}
