// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedTypeEntity _$BreedTypeEntityFromJson(Map<String, dynamic> json) {
  return BreedTypeEntity(
    breedid: json['breedid'] as int,
    breedname: json['breedname'] as String,
  );
}

Map<String, dynamic> _$BreedTypeEntityToJson(BreedTypeEntity instance) =>
    <String, dynamic>{
      'breedid': instance.breedid,
      'breedname': instance.breedname,
    };
