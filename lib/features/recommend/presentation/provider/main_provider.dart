import 'package:flutter/material.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_hit.dart';
import '../../domain/usecases/get_milestone.dart';
import '../../domain/usecases/get_today_tip.dart';

class MainProvider with ChangeNotifier {
  final GetTodayTip getTodayTip;
  final GetMilestone getMilestone;
  final GetComputerCPU getComputerCPU;
  final GetComputerCPUIdHit getComputerCPUIdHit;

  MainProvider(this.getTodayTip, this.getMilestone, this.getComputerCPUIdHit,
      this.getComputerCPU);

  Future<ComputerCPU> getComputerCPUHit(int index) async {
    int result = await getComputerCPUIdHit(index);
    return getComputerCPU(result);
  }

  Future<Milestone> getMileStone() async {
    return getMilestone();
  }
}
