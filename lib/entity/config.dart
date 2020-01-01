class BreedTypesEntity {
  final Map<int, String> types;

  const BreedTypesEntity({
    this.types,
  });

  factory BreedTypesEntity.fromJson(Map<String, dynamic> json) {
    return BreedTypesEntity(
      types: json['breedTypes'] as Map<int, String>,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['breedTypes'] = types;

    return json;
  }
}
