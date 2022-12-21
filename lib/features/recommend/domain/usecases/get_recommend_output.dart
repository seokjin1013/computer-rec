import '../entities/recommend_input.dart';
import '../entities/recommend_output.dart';
import '../repositories/recommend_repository.dart';

class GetRecommendOutput {
  final RecommendRepository recommendRepository;

  GetRecommendOutput(this.recommendRepository);

  Future<List<RecommendOutput>> call(RecommendInput recommendInput) async {
    return recommendRepository.getRecommendOutput(recommendInput);
  }
}
