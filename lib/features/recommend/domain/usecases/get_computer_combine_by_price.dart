import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../repositories/recommend_repository.dart';

class GetComputerCombineByPrice {
  final RecommendRepository recommendRepository;

  GetComputerCombineByPrice(this.recommendRepository);

  Future<Either<Failure, ComputerCPU>> call(int id) async {
    return await recommendRepository.getComputerCPU(id);
  }
}
