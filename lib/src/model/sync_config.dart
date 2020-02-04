import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

class SyncConfig extends Equatable {
  final Map<int, Breed> breedTypes;

  const SyncConfig._({
    @required this.breedTypes,
  });

  @override
  List<Object> get props => [];

  factory SyncConfig.fromEntity({
    @required List<BreedTypeEntity> breedTypes,
  }) {
    Map<int, Breed> _types = {};

    breedTypes.forEach(
      (entity) => _types[entity.breedid] = Breed(
        entity.breedid,
        entity.breedname,
      ),
    );

    return SyncConfig._(
      breedTypes: _types,
    );
  }
}
