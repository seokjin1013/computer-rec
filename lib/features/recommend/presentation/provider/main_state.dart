export 'recommend_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends MainState {}

class Loading extends MainState {}

class Loaded extends MainState {
  final List<int> ids;

  Loaded({required this.ids});

  @override
  List<Object> get props => [ids];
}

class Error extends MainState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
