import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class BlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
