import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/recommend_repository.dart';

class GetTodayTip {
  final RecommendRepository recommendRepository;

  GetTodayTip(this.recommendRepository);

  Future<String> call(int num) async {
    return await recommendRepository.getTodayTip(num);
  }
}
