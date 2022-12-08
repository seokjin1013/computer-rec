import 'dart:math';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/computer_item.dart';
import '../../domain/repositories/recommend_repository.dart';
import '../datasources/recommend_remote_data_source.dart';

class RecommendRepositoryImpl implements RecommendRepository {
  final RecommendRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecommendRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<int>>> getComputerCPUIdBestRange(
      int start, int end) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem =
            await remoteDataSource.getComputerCPUIdBestRange(start, end);
        return Right(remoteComputerItem);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorCode: e.errorCode));
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
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
