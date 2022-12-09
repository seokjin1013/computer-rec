import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_combine.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../entities/recommend_input_list.dart';
import '../repositories/recommend_repository.dart';

class GetRecommendOutput {
  final RecommendRepository recommendRepository;

  GetRecommendOutput(this.recommendRepository);

  Future<Either<Failure, List<RecommendOutput>>> call(
      RecommendInput recommendInput) async {
    return await recommendRepository.getRecommendOutput(recommendInput);
  }
}
