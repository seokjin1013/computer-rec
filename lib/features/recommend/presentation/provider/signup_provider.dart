import 'package:clean_architecture_flutter/features/recommend/presentation/provider/signup_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../../domain/usecases/create_new_account.dart';

class SignupProvider with ChangeNotifier {
  final CreateNewAccount createNewAccount;

  SignupProvider({required this.createNewAccount});

  Future<SignupState> querySignup(String id, String pw) async {
    Either<Failure, bool> result = await createNewAccount(id, pw);
    return result.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (isCreated) => Loaded(isCreated: isCreated));
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
