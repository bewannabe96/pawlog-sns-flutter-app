import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pawlog/entity/entity.dart';

import 'package:pawlog/model/model.dart';

class SyncConfig extends Equatable {
  final Map<int, Breed> breedTypes;

  const SyncConfig._({
    @required this.breedTypes,
  });

  @override
  List<Object> get props => [];

  factory SyncConfig.fromEntity({
    @required BreedTypesEntity breedTypes,
  }) {
    Map<int, Breed> _types = {};

    breedTypes.types.keys.forEach(
      (breedID) => _types[breedID] = Breed(breedID, breedTypes.types[breedID]),
    );

    return SyncConfig._(
      breedTypes: _types,
    );
  }
}
