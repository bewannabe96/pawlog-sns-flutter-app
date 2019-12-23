import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

class SyncConfig extends Equatable {
  final Map<int, Breed> breedTypes;

  const SyncConfig({
    @required this.breedTypes,
  });

  @override
  List<Object> get props => [];
}
