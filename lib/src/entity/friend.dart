import 'package:json_annotation/json_annotation.dart';

part 'friend.g.dart';

@JsonSerializable()
class FriendEntity {
  final int userid;
  final String email;
  final String name;
  final String imageurl;

  const FriendEntity({
    this.userid,
    this.email,
    this.name,
    this.imageurl,
  });

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FriendEntityToJson(this);
}
