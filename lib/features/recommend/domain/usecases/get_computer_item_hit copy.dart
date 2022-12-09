import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class GetBottleneckCPUVGA {
  final RecommendRepository recommendRepository;

  GetBottleneckCPUVGA(this.recommendRepository);

  Future<Either<Failure, double>> call(int cpuId, int vgaId) async {
    return await recommendRepository.getBottleneckCPUVGA(cpuId, vgaId);
  }
}
