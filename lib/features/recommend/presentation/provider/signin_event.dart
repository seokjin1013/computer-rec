import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QueryLogin extends SigninEvent {
  final String id;
  final String pw;

  QueryLogin(this.id, this.pw);

  @override
  List<Object?> get props => [id, pw];
}
