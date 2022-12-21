import '../entities/milestone.dart';
import '../repositories/recommend_repository.dart';

class GetMilestone {
  final RecommendRepository recommendRepository;

  GetMilestone(this.recommendRepository);

  Future<Milestone> call() async {
    return recommendRepository.getMilestone();
  }
}
