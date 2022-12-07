import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/is_exist_account.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final IsExistAccount isExistAccount;
  SigninBloc({required this.isExistAccount}) : super(Empty()) {
    on<QueryLogin>((event, emit) async {
      final String id = event.id;
      final String pw = event.pw;
      emit(Loading());
      final result = await isExistAccount(id, pw);
      emit(result.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (isExist) => Loaded(isExist: isExist)));
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
