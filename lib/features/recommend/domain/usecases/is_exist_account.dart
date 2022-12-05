import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class IsExistAccount {
  final RecommendRepository recommendRepository;

  IsExistAccount(this.recommendRepository);

  Future<Either<Failure, bool>> call(String id, String pw) async {
    if (kDebugMode) return Right(true);
    return await recommendRepository.isExistAccount(id, pw);
  }
}
