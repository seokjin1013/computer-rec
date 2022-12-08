import 'package:equatable/equatable.dart';

abstract class GetComputerCPUBestIdState {}

class Loading extends GetComputerCPUBestIdState {
  Loading();
}

class Loaded extends GetComputerCPUBestIdState {
  final int ids;

  Loaded({required this.ids});
}

class Error extends GetComputerCPUBestIdState {
  final String message;

  Error({required this.message});
}
