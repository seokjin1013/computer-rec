import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_hit.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_today_tip.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_best_range.dart';

class MainProvider with ChangeNotifier {
  final GetTodayTip getTodayTip;
  final GetMilestone getMilestone;
  final GetComputerCPU getComputerCPU;
  final GetComputerCPUIdHit getComputerCPUIdHit;

  MainProvider(this.getTodayTip, this.getMilestone, this.getComputerCPUIdHit,
      this.getComputerCPU);

  Future<Either<Failure, ComputerCPU>> getComputerCPUHit(int index) async {
    Either<Failure, int> result = await getComputerCPUIdHit(index);
    if (result.isLeft()) {
      return Left(result.asLeft());
    }
    int id = result.asRight();
    return getComputerCPU(id);
  }

  Future<Either<Failure, Milestone>> getMileStone() async {
    return getMilestone();
  }
}
