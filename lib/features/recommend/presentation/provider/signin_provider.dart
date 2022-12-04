import 'package:clean_architecture_flutter/features/recommend/domain/usecases/is_exist_account.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/signin_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';

class SigninProvider with ChangeNotifier {
  final IsExistAccount isExistAccount;

  SigninProvider({required this.isExistAccount});

  Future<SigninState> querySignin(String id, String pw) async {
    Either<Failure, bool> result = await isExistAccount(id, pw);
    return result.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (isExist) => Loaded(isExist: isExist));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected error';
    }
  }
}
