import 'package:equatable/equatable.dart';

abstract class RecommendEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QueryLogin extends RecommendEvent {
  final String id;
  final String pw;

  QueryLogin(this.id, this.pw);

  @override
  List<Object?> get props => [id, pw];
}
