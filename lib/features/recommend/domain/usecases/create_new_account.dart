import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../repositories/recommend_repository.dart';

class CreateNewAccount {
  final RecommendRepository recommendRepository;

  CreateNewAccount(this.recommendRepository);

  Future<Either<Failure, bool>> call(String id, String pw) async {
    return await recommendRepository.createNewAccount(id, pw);
  }
}
