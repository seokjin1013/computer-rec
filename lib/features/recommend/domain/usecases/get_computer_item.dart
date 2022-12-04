import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../repositories/recommend_repository.dart';

class GetComputerItem {
  final RecommendRepository recommendRepository;

  GetComputerItem(this.recommendRepository);

  Future<Either<Failure, ComputerItem>> call(int id) async {
    return await recommendRepository.getComputerItem(id);
  }
}
