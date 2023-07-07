import 'package:flutter/foundation.dart';

import '../repositories/recommend_repository.dart';

class IsExistAccount {
  final RecommendRepository recommendRepository;

  IsExistAccount(this.recommendRepository);

  Future<bool> call(String id, String pw) async {
    if (kDebugMode) return true;
    return recommendRepository.isExistAccount(id, pw);
  }
}
