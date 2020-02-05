import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class BreedTypeEntity {
  final int breedid;
  final String breedname;

  const BreedTypeEntity({
    this.breedid,
    this.breedname,
  });

  factory BreedTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$BreedTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BreedTypeEntityToJson(this);
}
