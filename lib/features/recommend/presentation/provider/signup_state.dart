abstract class SignupState {}

class Empty extends SignupState {}

class Loading extends SignupState {}

class Loaded extends SignupState {
  final bool isCreated;

  Loaded({required this.isCreated});
}

class Error extends SignupState {
  final String message;

  Error({required this.message});
}
