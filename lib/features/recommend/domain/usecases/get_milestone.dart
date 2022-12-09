import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/milestone.dart';
import '../repositories/recommend_repository.dart';

class GetMilestone {
  final RecommendRepository recommendRepository;

  GetMilestone(this.recommendRepository);

  Future<Either<Failure, Milestone>> call() async {
    return await recommendRepository.getMilestone();
  }
}
