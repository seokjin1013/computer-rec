import '../repositories/recommend_repository.dart';

class GetComputerCPUIdBestRange {
  final RecommendRepository recommendRepository;

  GetComputerCPUIdBestRange(this.recommendRepository);

  Future<List<int>> call(int start, int end) async {
    return recommendRepository.getComputerCPUIdBestRange(start, end);
  }
}
