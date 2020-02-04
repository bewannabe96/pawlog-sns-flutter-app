import 'package:pawlog/src/entity/entity.dart';

class Breed {
  final int breedID;
  final String title;

  const Breed(this.breedID, this.title);
}

class Pet {
  final int petID;
  final String name;
  final int breed;
  final String imageURL;

  const Pet({
    this.petID,
    this.name,
    this.breed,
    this.imageURL,
  });

  factory Pet.fromEntity(PetEntity entity) {
    return Pet(
      petID: entity.petid,
      name: entity.name,
      breed: entity.breed,
      imageURL: entity.imageurl,
    );
  }
}

class Family {
  final String name;

  final List<Pet> pets;

  Family._({
    this.name,
    this.pets,
  });

  factory Family.fromEntity(FamilyEntity entity) {
    return Family._(
      name: entity.name,
      pets: entity.pets.map((value) => Pet.fromEntity(value)).toList(),
    );
  }

  Family registerPet(Pet pet) {
    pets.add(pet);
    return this;
  }
}