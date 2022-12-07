import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class PostNewAccount {
  final RecommendRepository recommendRepository;

  PostNewAccount(this.recommendRepository);

  Future<Either<Failure, bool>> call(String id, String pw) async {
    return await recommendRepository.postNewAccount(id, pw);
  }
}
