import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_best_range.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/is_exist_account.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetComputerCPUIdBestRange getComputerCPUIdBestRange;
  MainBloc({required this.getComputerCPUIdBestRange}) : super(Empty()) {
    on<QueryBestCpuIdRange>((event, emit) async {
      final int start = event.start;
      final int end = event.end;
      emit(Loading());
      final result = await getComputerCPUIdBestRange(start, end);
      emit(result.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (ids) => Loaded(ids: ids)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return '서버와 연결할 수 없습니다.';
      default:
        return 'Unexpected error';
    }
  }
}
