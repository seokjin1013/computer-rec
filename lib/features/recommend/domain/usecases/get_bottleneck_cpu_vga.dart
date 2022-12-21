import '../repositories/recommend_repository.dart';

class GetBottleneckCPUVGA {
  final RecommendRepository recommendRepository;

  GetBottleneckCPUVGA(this.recommendRepository);

  Future<double> call(int cpuId, int vgaId) async {
    return recommendRepository.getBottleneckCPUVGA(cpuId, vgaId);
  }
}
