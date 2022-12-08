import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_best_range.dart';

class MainProvider with ChangeNotifier {
  final GetComputerCPU getComputerCPU;
  final GetComputerCPUIdBestRange getComputerCPUIdBestRange;

  MainProvider(this.getComputerCPUIdBestRange, this.getComputerCPU);

  Future<Either<Failure, ComputerCPU>> getComputerCPUBest(int index) async {
    Either<Failure, List<int>> result =
        await getComputerCPUIdBestRange(index, index);
    if (result.isLeft()) {
      return Left(result.asLeft());
    }
    int id = result.asRight().first;
    return getComputerCPU(id);
  }
}
