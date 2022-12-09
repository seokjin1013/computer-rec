import 'package:clean_architecture_flutter/features/recommend/domain/entities/milestone.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/computer_item.dart';

abstract class RecommendRepository {
  Future<Either<Failure, Milestone>> getMilestone();
  Future<Either<Failure, List<int>>> getComputerCPUIdBestRange(
      int start, int end);
  Future<Either<Failure, ComputerCPU>> getComputerCPU(int id);
  Future<Either<Failure, ComputerVGA>> getComputerVGA(int id);
  Future<Either<Failure, ComputerRAM>> getComputerRAM(int id);
  Future<Either<Failure, ComputerMainBoard>> getComputerMainBoard(int id);
  Future<Either<Failure, ComputerSSD>> getComputerSSD(int id);
  Future<Either<Failure, ComputerHDD>> getComputerHDD(int id);
  Future<Either<Failure, ComputerCooler>> getComputerCooler(int id);
  Future<Either<Failure, ComputerPower>> getComputerPower(int id);
  Future<Either<Failure, ComputerCase>> getComputerCase(int id);
  Future<Either<Failure, bool>> isExistAccount(String id, String pw);
  Future<Either<Failure, bool>> postNewAccount(String id, String pw);
}
