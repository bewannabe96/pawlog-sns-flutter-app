import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class FamilyState extends Equatable {
  final Family family;
  final bool processing;
  final String error;

  const FamilyState._({
    this.family,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => [family];

  FamilyState copyWith({
    Family family,
    bool processing,
    String error,
  }) {
    return FamilyState._(
      family: family ?? this.family,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory FamilyState.initialState() => FamilyState._(
        family: null,
        processing: false,
        error: null,
      );
}
