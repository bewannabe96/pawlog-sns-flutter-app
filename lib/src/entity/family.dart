import 'package:json_annotation/json_annotation.dart';
import 'package:pawlog/src/entity/entity.dart';

part 'family.g.dart';

@JsonSerializable()
class PetEntity {
  final int petid;
  final String name;
  final int breed;
  final String imageurl;

  const PetEntity({
    this.petid,
    this.name,
    this.breed,
    this.imageurl,
  });

  factory PetEntity.fromJson(Map<String, dynamic> json) =>
      _$PetEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PetEntityToJson(this);
}

@JsonSerializable()
class FamilyEntity {
  final int familyid;
  final String name;

  final List<FriendEntity> users;
  final List<PetEntity> pets;

  const FamilyEntity({
    this.familyid,
    this.name,
    this.users,
    this.pets,
  });

  factory FamilyEntity.fromJson(Map<String, dynamic> json) =>
      _$FamilyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyEntityToJson(this);
}
