import '../repositories/recommend_repository.dart';

class GetComputerCPUIdHit {
  final RecommendRepository recommendRepository;

  GetComputerCPUIdHit(this.recommendRepository);

  Future<int> call(int rank) async {
    return recommendRepository.getComputerCPUIdHit(rank);
  }
}
