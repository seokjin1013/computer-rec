import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/computer_item.dart';
import '../repositories/recommend_repository.dart';

class GetComputerCPU {
  final RecommendRepository recommendRepository;

  GetComputerCPU(this.recommendRepository);

  Future<Either<Failure, ComputerCPU>> call(int id) async {
    return await recommendRepository.getComputerCPU(id);
  }
}

class GetComputerVGA {
  final RecommendRepository recommendRepository;

  GetComputerVGA(this.recommendRepository);

  Future<Either<Failure, ComputerVGA>> call(int id) async {
    return await recommendRepository.getComputerVGA(id);
  }
}

class GetComputerRAM {
  final RecommendRepository recommendRepository;

  GetComputerRAM(this.recommendRepository);

  Future<Either<Failure, ComputerRAM>> call(int id) async {
    return await recommendRepository.getComputerRAM(id);
  }
}

class GetComputerMainBoard {
  final RecommendRepository recommendRepository;

  GetComputerMainBoard(this.recommendRepository);

  Future<Either<Failure, ComputerMainBoard>> call(int id) async {
    return await recommendRepository.getComputerMainBoard(id);
  }
}

class GetComputerSSD {
  final RecommendRepository recommendRepository;

  GetComputerSSD(this.recommendRepository);

  Future<Either<Failure, ComputerSSD>> call(int id) async {
    return await recommendRepository.getComputerSSD(id);
  }
}

class GetComputerHDD {
  final RecommendRepository recommendRepository;

  GetComputerHDD(this.recommendRepository);

  Future<Either<Failure, ComputerHDD>> call(int id) async {
    return await recommendRepository.getComputerHDD(id);
  }
}

class GetComputerCooler {
  final RecommendRepository recommendRepository;

  GetComputerCooler(this.recommendRepository);

  Future<Either<Failure, ComputerCooler>> call(int id) async {
    return await recommendRepository.getComputerCooler(id);
  }
}

class GetComputerPower {
  final RecommendRepository recommendRepository;

  GetComputerPower(this.recommendRepository);

  Future<Either<Failure, ComputerPower>> call(int id) async {
    return await recommendRepository.getComputerPower(id);
  }
}

class GetComputerCase {
  final RecommendRepository recommendRepository;

  GetComputerCase(this.recommendRepository);

  Future<Either<Failure, ComputerCase>> call(int id) async {
    return await recommendRepository.getComputerCase(id);
  }
}
