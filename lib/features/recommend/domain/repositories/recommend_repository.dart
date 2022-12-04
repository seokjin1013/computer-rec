import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/computer_item.dart';

abstract class RecommendRepository {
  Future<Either<Failure, ComputerItem>> getComputerItem(int id);
  Future<Either<Failure, bool>> isExistAccount(String id, String pw);
  Future<Either<Failure, bool>> createNewAccount(String id, String pw);
}
