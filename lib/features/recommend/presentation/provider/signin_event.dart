import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckExistAccount extends SigninEvent {
  final String id;
  final String pw;

  CheckExistAccount(this.id, this.pw);

  @override
  List<Object?> get props => [id, pw];
}
