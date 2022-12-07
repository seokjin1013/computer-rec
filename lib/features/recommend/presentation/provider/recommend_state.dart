export 'recommend_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class RecommendState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends RecommendState {}

class Loading extends RecommendState {}

class Loaded extends RecommendState {
  final bool isExist;

  Loaded({required this.isExist});

  @override
  List<Object> get props => [isExist];
}

class Error extends RecommendState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
