abstract class SigninState {}

class Empty extends SigninState {}

class Loading extends SigninState {}

class Loaded extends SigninState {
  final bool isExist;

  Loaded({required this.isExist});
}

class Error extends SigninState {
  final String message;

  Error({required this.message});
}
