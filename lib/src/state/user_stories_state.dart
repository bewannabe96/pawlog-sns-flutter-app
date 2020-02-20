import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class UserStoriesState extends Equatable {
  final List<Story> stories;
  final int currentPage;
  final bool reachedMax;
  final bool loading;
  final String error;

  const UserStoriesState._({
    this.stories,
    this.currentPage,
    this.reachedMax,
    this.loading,
    this.error,
  });

  @override
  List<Object> get props => [currentPage];

  UserStoriesState copyWith({
    List<Story> stories,
    int currentPage,
    bool reachedMax,
    bool loading,
    String error,
  }) {
    return UserStoriesState._(
      stories: stories ?? this.stories,
      currentPage: currentPage ?? this.currentPage,
      reachedMax: reachedMax ?? this.reachedMax,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  factory UserStoriesState.initialState() => UserStoriesState._(
        stories: const [],
        currentPage: 0,
        reachedMax: false,
        loading: false,
        error: null,
      );
}
