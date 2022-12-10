import '../repositories/recommend_repository.dart';

class GetTodayTip {
  final RecommendRepository recommendRepository;

  GetTodayTip(this.recommendRepository);

  Future<String> call(int num) async {
    return await recommendRepository.getTodayTip(num);
  }
}
