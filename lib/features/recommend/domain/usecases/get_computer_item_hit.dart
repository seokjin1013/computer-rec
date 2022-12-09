import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class GetComputerCPUIdHit {
  final RecommendRepository recommendRepository;

  GetComputerCPUIdHit(this.recommendRepository);

  Future<Either<Failure, int>> call(int rank) async {
    return await recommendRepository.getComputerCPUIdHit(rank);
  }
}
