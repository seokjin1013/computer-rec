import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SigninState {}

class Loading extends SigninState {}

class Loaded extends SigninState {
  final bool isExist;

  Loaded({required this.isExist});

  @override
  List<Object> get props => [isExist];
}

class Error extends SigninState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
