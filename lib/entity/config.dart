class BreedTypeEntity {
  final int breedID;
  final String title;

  const BreedTypeEntity._({
    this.breedID,
    this.title,
  });

  factory BreedTypeEntity.fromJson(Map<String, dynamic> json) {
    return BreedTypeEntity._(
      breedID: json['breedid'],
      title: json['breedname'],
    );
  }
}
