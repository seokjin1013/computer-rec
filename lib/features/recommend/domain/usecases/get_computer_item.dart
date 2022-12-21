import '../entities/computer_item.dart';
import '../repositories/recommend_repository.dart';

class GetComputerCPU {
  final RecommendRepository recommendRepository;

  GetComputerCPU(this.recommendRepository);

  Future<ComputerCPU> call(int id) async {
    return recommendRepository.getComputerCPU(id);
  }
}

class GetComputerVGA {
  final RecommendRepository recommendRepository;

  GetComputerVGA(this.recommendRepository);

  Future<ComputerVGA> call(int id) async {
    return recommendRepository.getComputerVGA(id);
  }
}

class GetComputerRAM {
  final RecommendRepository recommendRepository;

  GetComputerRAM(this.recommendRepository);

  Future<ComputerRAM> call(int id) async {
    return recommendRepository.getComputerRAM(id);
  }
}

class GetComputerMainBoard {
  final RecommendRepository recommendRepository;

  GetComputerMainBoard(this.recommendRepository);

  Future<ComputerMainBoard> call(int id) async {
    return recommendRepository.getComputerMainBoard(id);
  }
}

class GetComputerSSD {
  final RecommendRepository recommendRepository;

  GetComputerSSD(this.recommendRepository);

  Future<ComputerSSD> call(int id) async {
    return recommendRepository.getComputerSSD(id);
  }
}

class GetComputerHDD {
  final RecommendRepository recommendRepository;

  GetComputerHDD(this.recommendRepository);

  Future<ComputerHDD> call(int id) async {
    return recommendRepository.getComputerHDD(id);
  }
}

class GetComputerCooler {
  final RecommendRepository recommendRepository;

  GetComputerCooler(this.recommendRepository);

  Future<ComputerCooler> call(int id) async {
    return recommendRepository.getComputerCooler(id);
  }
}

class GetComputerPower {
  final RecommendRepository recommendRepository;

  GetComputerPower(this.recommendRepository);

  Future<ComputerPower> call(int id) async {
    return recommendRepository.getComputerPower(id);
  }
}

class GetComputerCase {
  final RecommendRepository recommendRepository;

  GetComputerCase(this.recommendRepository);

  Future<ComputerCase> call(int id) async {
    return recommendRepository.getComputerCase(id);
  }
}
