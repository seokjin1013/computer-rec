import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class GetComputerCPUIdBestRange {
  final RecommendRepository recommendRepository;

  GetComputerCPUIdBestRange(this.recommendRepository);

  Future<Either<Failure, List<int>>> call(int start, int end) async {
    return await recommendRepository.getComputerCPUIdBestRange(start, end);
  }
}
