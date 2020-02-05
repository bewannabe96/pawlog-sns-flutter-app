class SignInAction {
  String email;
  String password;

  SignInAction({
    this.email,
    this.password,
  });

  @override
  String toString() => 'SignInAction{email: $email, password: $password}';
}
