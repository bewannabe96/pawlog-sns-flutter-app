import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isSignedIn;

  AuthState({
    this.isSignedIn,
  });

  @override
  List<Object> get props => [isSignedIn];

  AuthState copyWith({
    bool isSignedIn,
  }) {
    return AuthState(
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }

  AuthState.initialState() : isSignedIn = false;
}
