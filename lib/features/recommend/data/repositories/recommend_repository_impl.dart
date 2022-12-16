import 'dart:math';

import 'package:http/http.dart';

import '../../domain/entities/milestone.dart';
import '../../domain/usecases/get_computer_item_hit%20copy.dart';
import '../../domain/usecases/get_recommend_output.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/entities/computer_item.dart';
import '../../domain/entities/program_fit.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/repositories/recommend_repository.dart';
import '../datasources/recommend_local_data_source.dart';
import '../datasources/recommend_remote_data_source.dart';

class RecommendRepositoryImpl implements RecommendRepository {
  final RecommendLocalDataSource localDataSource;
  final RecommendRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecommendRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<String> getTodayTip(int num) async {
    return localDataSource.getTodayTip(num);
  }

  @override
  Future<Either<Failure, List<ProgramFit>>> getComputerProgramFit(
      int vgaId, int purpose) async {
    if (await networkInfo.isConnected) {
      try {
        final recommendOutputs =
            await remoteDataSource.getComputerProgramFit(vgaId, purpose);
        return Right(recommendOutputs);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getBottleneckCPUVGA(
      int cpuId, int vgaId) async {
    if (await networkInfo.isConnected) {
      try {
        final recommendOutputs =
            await remoteDataSource.getBottleneckCPUVGA(cpuId, vgaId);
        return Right(recommendOutputs);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<RecommendOutput>>> getRecommendOutput(
      RecommendInput recommendInput) async {
    if (await networkInfo.isConnected) {
      try {
        final recommendOutputs =
            await remoteDataSource.getRecommendOutput(recommendInput);
        return Right(recommendOutputs);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Milestone>> getMilestone() async {
    if (await networkInfo.isConnected) {
      try {
        final milestone = await remoteDataSource.getMilestone();
        return Right(milestone);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getComputerCPUIdHit(int rank) async {
    if (await networkInfo.isConnected) {
      try {
        final computerCPUHitId =
            await remoteDataSource.getComputerCPUIdHit(rank);
        return Right(computerCPUHitId);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<int>>> getComputerCPUIdBestRange(
      int start, int end) async {
    if (await networkInfo.isConnected) {
      try {
        final computerCPUBestId =
            await remoteDataSource.getComputerCPUIdBestRange(start, end);
        return Right(computerCPUBestId);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerCPU>> getComputerCPU(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerCPU(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerVGA>> getComputerVGA(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerVGA(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerRAM>> getComputerRAM(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerRAM(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerMainBoard>> getComputerMainBoard(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem =
            await remoteDataSource.getComputerMainBoard(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerSSD>> getComputerSSD(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerSSD(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerHDD>> getComputerHDD(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerHDD(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerCooler>> getComputerCooler(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerCooler(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerPower>> getComputerPower(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerPower(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ComputerCase>> getComputerCase(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerCase(id);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isExistAccount(String id, String pw) async {
    if (await networkInfo.isConnected) {
      try {
        final isExist = await remoteDataSource.isExistAccount(id, pw);
        return Right(isExist);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> postNewAccount(String id, String pw) async {
    if (await networkInfo.isConnected) {
      try {
        final isCreated = await remoteDataSource.postNewAccount(id, pw);
        return Right(isCreated);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
      } on ClientException {
        return Left(ClientFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
