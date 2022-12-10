import 'package:clean_architecture_flutter/features/recommend/domain/entities/recommend_output.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../entities/recommend_input.dart';
import '../repositories/recommend_repository.dart';

class GetRecommendOutput {
  final RecommendRepository recommendRepository;

  GetRecommendOutput(this.recommendRepository);

  Future<Either<Failure, List<RecommendOutput>>> call(
      RecommendInput recommendInput) async {
    return await recommendRepository.getRecommendOutput(recommendInput);
  }
}
