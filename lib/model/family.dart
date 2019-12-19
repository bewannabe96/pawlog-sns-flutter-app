import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class Breed {
  final int breedID;
  final String title;

  const Breed(this.breedID, this.title);
}

class Pet {
  final int petID;
  final String name;
  final String breed;
  final String imageURL;

  const Pet._({
    @required this.petID,
    @required this.name,
    @required this.breed,
    this.imageURL,
  });

  factory Pet.fromEntity(PetEntity entity) {
    return Pet._(
      petID: entity.petID,
      name: entity.name,
      breed: entity.breed,
      imageURL: entity.imageURL,
    );
  }
}

class Family {
  final String name;

  final List<Pet> pets;

  Family._({
    @required this.name,
    @required this.pets,
  });

  factory Family.fromEntity(FamilyEntity entity) {
    return Family._(
      name: entity.name,
      pets: entity.pets.map((value) => Pet.fromEntity(value)).toList(),
    );
  }
}
