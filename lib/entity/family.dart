import 'package:meta/meta.dart';

class PetEntity {
  final int petID;
  final String name;
  final int breed;
  final String imageURL;

  const PetEntity({
    this.petID,
    this.name,
    this.breed,
    this.imageURL,
  });

  factory PetEntity.fromJson(Map<String, dynamic> json) {
    return PetEntity(
      petID: json['petid'],
      name: json['name'],
      breed: json['breed'],
      imageURL: json['imageurl'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['petid'] = petID;
    json['name'] = name;
    json['breed'] = breed;
    json['imageurl'] = imageURL;

    return json;
  }
}

class FamilyEntity {
  final String name;

  final List<PetEntity> pets;

  const FamilyEntity({
    @required this.name,
    this.pets = const [],
  }) : assert(pets != null);

  factory FamilyEntity.fromJson(Map<String, dynamic> json) {
    return FamilyEntity(
      name: json['name'],
      pets: (json['pets'] as List)
          .map((value) => PetEntity.fromJson(value))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['name'] = name;
    json['pets'] = pets.map((value) => value.toJson()).toList();

    return json;
  }
}
