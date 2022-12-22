import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_ranking.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/usecases/get_computer_item.dart';

class ComputerItemListProvider with ChangeNotifier {
  final GetComputerCPU getComputerCPU;
  final GetComputerVGA getComputerVGA;
  final GetComputerRAM getComputerRAM;
  final GetComputerMainBoard getComputerMainBoard;
  final GetComputerSSD getComputerSSD;
  final GetComputerHDD getComputerHDD;
  final GetComputerCooler getComputerCooler;
  final GetComputerPower getComputerPower;
  final GetComputerCase getComputerCase;
  final GetComputerMonitor getComputerMonitor;
  final GetComputerKeyboard getComputerKeyboard;
  final GetComputerMouse getComputerMouse;
  final GetComputerCPURanking getComputerCPURanking;
  final GetComputerVGARanking getComputerVGARanking;
  final GetComputerRAMRanking getComputerRAMRanking;
  final GetComputerMainBoardRanking getComputerMainBoardRanking;
  final GetComputerSSDRanking getComputerSSDRanking;
  final GetComputerHDDRanking getComputerHDDRanking;
  final GetComputerCoolerRanking getComputerCoolerRanking;
  final GetComputerPowerRanking getComputerPowerRanking;
  final GetComputerCaseRanking getComputerCaseRanking;
  final GetComputerMonitorRanking getComputerMonitorRanking;
  final GetComputerKeyboardRanking getComputerKeyboardRanking;
  final GetComputerMouseRanking getComputerMouseRanking;

  ComputerItemListProvider(
    this.getComputerCPU,
    this.getComputerVGA,
    this.getComputerRAM,
    this.getComputerMainBoard,
    this.getComputerSSD,
    this.getComputerHDD,
    this.getComputerCooler,
    this.getComputerPower,
    this.getComputerCase,
    this.getComputerMonitor,
    this.getComputerKeyboard,
    this.getComputerMouse,
    this.getComputerCPURanking,
    this.getComputerVGARanking,
    this.getComputerRAMRanking,
    this.getComputerMainBoardRanking,
    this.getComputerSSDRanking,
    this.getComputerHDDRanking,
    this.getComputerCoolerRanking,
    this.getComputerPowerRanking,
    this.getComputerCaseRanking,
    this.getComputerMonitorRanking,
    this.getComputerKeyboardRanking,
    this.getComputerMouseRanking,
  );

  Future<List<Future<ComputerCPU>>> getComputerCPUList() async {
    return getComputerCPURanking().then((value) {
      List<Future<ComputerCPU>> result = [];
      for (int id in value) {
        result.add(getComputerCPU(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerVGA>>> getComputerVGAList() async {
    return getComputerVGARanking().then((value) {
      List<Future<ComputerVGA>> result = [];
      for (int id in value) {
        result.add(getComputerVGA(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerRAM>>> getComputerRAMList() async {
    return getComputerRAMRanking().then((value) {
      List<Future<ComputerRAM>> result = [];
      for (int id in value) {
        result.add(getComputerRAM(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerMainBoard>>> getComputerMainBoardList() async {
    return getComputerMainBoardRanking().then((value) {
      List<Future<ComputerMainBoard>> result = [];
      for (int id in value) {
        result.add(getComputerMainBoard(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerSSD>>> getComputerSSDList() async {
    return getComputerSSDRanking().then((value) {
      List<Future<ComputerSSD>> result = [];
      for (int id in value) {
        result.add(getComputerSSD(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerHDD>>> getComputerHDDList() async {
    return getComputerHDDRanking().then((value) {
      List<Future<ComputerHDD>> result = [];
      for (int id in value) {
        result.add(getComputerHDD(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerCooler>>> getComputerCoolerList() async {
    return getComputerCoolerRanking().then((value) {
      List<Future<ComputerCooler>> result = [];
      for (int id in value) {
        result.add(getComputerCooler(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerPower>>> getComputerPowerList() async {
    return getComputerPowerRanking().then((value) {
      List<Future<ComputerPower>> result = [];
      for (int id in value) {
        result.add(getComputerPower(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerCase>>> getComputerCaseList() async {
    return getComputerCaseRanking().then((value) {
      List<Future<ComputerCase>> result = [];
      for (int id in value) {
        result.add(getComputerCase(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerMonitor>>> getComputerMonitorList() async {
    return getComputerMonitorRanking().then((value) {
      List<Future<ComputerMonitor>> result = [];
      for (int id in value) {
        result.add(getComputerMonitor(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerKeyboard>>> getComputerKeyboardList() async {
    return getComputerKeyboardRanking().then((value) {
      List<Future<ComputerKeyboard>> result = [];
      for (int id in value) {
        result.add(getComputerKeyboard(id));
      }
      return result;
    });
  }

  Future<List<Future<ComputerMouse>>> getComputerMouseList() async {
    return getComputerMouseRanking().then((value) {
      List<Future<ComputerMouse>> result = [];
      for (int id in value) {
        result.add(getComputerMouse(id));
      }
      return result;
    });
  }
}
