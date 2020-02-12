// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetEntity _$PetEntityFromJson(Map<String, dynamic> json) {
  return PetEntity(
    petid: json['petid'] as int,
    name: json['name'] as String,
    breed: json['breed'] as int,
    imageurl: json['imageurl'] as String,
  );
}

Map<String, dynamic> _$PetEntityToJson(PetEntity instance) => <String, dynamic>{
      'petid': instance.petid,
      'name': instance.name,
      'breed': instance.breed,
      'imageurl': instance.imageurl,
    };

FamilyEntity _$FamilyEntityFromJson(Map<String, dynamic> json) {
  return FamilyEntity(
    familyid: json['familyid'] as int,
    name: json['name'] as String,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : FriendEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pets: (json['pets'] as List)
        ?.map((e) =>
            e == null ? null : PetEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FamilyEntityToJson(FamilyEntity instance) =>
    <String, dynamic>{
      'familyid': instance.familyid,
      'name': instance.name,
      'users': instance.users,
      'pets': instance.pets,
    };
