import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/recommend_remote_data_source.dart';
import '../../domain/entities/computer_item.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/recommend_repository.dart';
import 'package:dartz/dartz.dart';

class RecommendRepositoryImpl implements RecommendRepository {
  final RecommendRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecommendRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ComputerItem>> getComputerItem(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComputerItem = await remoteDataSource.getComputerItem(id);
        return Right(remoteComputerItem);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isExistAccount(String id, String pw) async {
    if (await networkInfo.isConnected) {
      try {
        final isExist = await remoteDataSource.isExistAccount(id, pw);
        return Right(isExist);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createNewAccount(String id, String pw) async {
    if (await networkInfo.isConnected) {
      try {
        final isCreated = await remoteDataSource.createNewAccount(id, pw);
        return Right(isCreated);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
