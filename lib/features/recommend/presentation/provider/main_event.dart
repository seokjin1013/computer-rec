import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QueryBestCpuIdRange extends MainEvent {
  final int start;
  final int end;

  QueryBestCpuIdRange(this.start, this.end);

  @override
  List<Object?> get props => [start, end];
}
