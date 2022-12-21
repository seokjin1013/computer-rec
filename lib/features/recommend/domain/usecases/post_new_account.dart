import '../repositories/recommend_repository.dart';

class PostNewAccount {
  final RecommendRepository recommendRepository;

  PostNewAccount(this.recommendRepository);

  Future<bool> call(String id, String pw) async {
    return recommendRepository.postNewAccount(id, pw);
  }
}
