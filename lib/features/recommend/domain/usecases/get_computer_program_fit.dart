import '../entities/program_fit.dart';
import '../repositories/recommend_repository.dart';

class GetComputerProgramFit {
  final RecommendRepository recommendRepository;

  GetComputerProgramFit(this.recommendRepository);

  Future<List<ProgramFit>> call(int vgaId, int purpose) async {
    return recommendRepository.getComputerProgramFit(vgaId, purpose);
  }
}
