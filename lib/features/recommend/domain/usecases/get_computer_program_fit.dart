import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/computer_item.dart';
import '../entities/program_fit.dart';
import '../repositories/recommend_repository.dart';

class GetComputerProgramFit {
  final RecommendRepository recommendRepository;

  GetComputerProgramFit(this.recommendRepository);

  Future<Either<Failure, List<ProgramFit>>> call(int vgaId, int purpose) async {
    return await recommendRepository.getComputerProgramFit(vgaId, purpose);
  }
}
