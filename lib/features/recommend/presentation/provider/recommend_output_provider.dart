import 'package:flutter/material.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/entities/no_item.dart';
import '../../domain/entities/program_fit.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/usecases/get_bottleneck_cpu_vga.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_program_fit.dart';
import '../../domain/usecases/get_recommend_output.dart';

class RecommendOutputProvider with ChangeNotifier {
  final GetComputerProgramFit getComputerProgramFit;
  final GetBottleneckCPUVGA getBottleneckCPUVGA;
  final GetRecommendOutput getRecommendOutput;
  final GetComputerCPU getComputerCPU;
  final GetComputerVGA getComputerVGA;
  final GetComputerRAM getComputerRAM;
  final GetComputerMainBoard getComputerMainBoard;
  final GetComputerSSD getComputerSSD;
  final GetComputerHDD getComputerHDD;
  final GetComputerCooler getComputerCooler;
  final GetComputerPower getComputerPower;
  final GetComputerCase getComputerCase;

  RecommendOutputProvider(
      this.getComputerProgramFit,
      this.getBottleneckCPUVGA,
      this.getRecommendOutput,
      this.getComputerCPU,
      this.getComputerVGA,
      this.getComputerRAM,
      this.getComputerMainBoard,
      this.getComputerSSD,
      this.getComputerHDD,
      this.getComputerCooler,
      this.getComputerPower,
      this.getComputerCase);

  Future<List<RecommendOutput>> getRecommendOutputList(
      RecommendInput recommendInput) async {
    List<RecommendOutput> result = await getRecommendOutput(recommendInput);
    return result;
  }

  late Future<List<RecommendOutput>> results;
  List<Future<ComputerCPU>> cpu = [];
  List<Future<ComputerVGA>> vga = [];
  List<Future<ComputerRAM>> ram = [];
  List<Future<ComputerMainBoard>> mainboard = [];
  List<Future<ComputerSSD>> ssd = [];
  List<Future<ComputerHDD>> hdd = [];
  List<Future<ComputerCooler>> cooler = [];
  List<Future<ComputerPower>> power = [];
  List<Future<ComputerCase>> ccase = [];
  List<Future<double>> bottleneck = [];
  List<Future<List<ProgramFit>>> programFit = [];

  void setRecommendOutputList(RecommendInput recommendInput) async {
    results = getRecommendOutput(recommendInput);
    results.then((value) {
      List<RecommendOutput> r = value;
      for (int i = 0; i < r.length; ++i) {
        cpu.add(r[i].numCpu > 0
            ? getComputerCPU(r[i].cpuId)
            : Future.value(NoCPU()));
        vga.add(r[i].numVga > 0
            ? getComputerVGA(r[i].vgaId)
            : Future.value(NoVGA()));
        ram.add(r[i].numRam > 0
            ? getComputerRAM(r[i].ramId)
            : Future.value(NoRAM()));
        mainboard.add(r[i].numMainboard > 0
            ? getComputerMainBoard(r[i].mainboardId)
            : Future.value(NoMainBoard()));
        ssd.add(r[i].numSsd > 0
            ? getComputerSSD(r[i].ssdId)
            : Future.value(NoSSD()));
        hdd.add(r[i].numHdd > 0
            ? getComputerHDD(r[i].hddId)
            : Future.value(NoHDD()));
        cooler.add(r[i].numCooler > 0
            ? getComputerCooler(r[i].coolerId)
            : Future.value(NoCooler()));
        power.add(r[i].numPower > 0
            ? getComputerPower(r[i].powerId)
            : Future.value(NoPower()));
        ccase.add(r[i].numCase > 0
            ? getComputerCase(r[i].caseId)
            : Future.value(NoCase()));
        bottleneck.add(Future.wait([cpu.last, vga.last]).then((value) {
          return getBottleneckCPUVGA(value[0].id, value[1].id);
        }));
        programFit.add(vga.last.then((value) {
          return getComputerProgramFit(value.id, recommendInput.purpose);
        }));
      }
    });
  }

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;
  set viewIndex(int value) {
    _viewIndex = value;
    notifyListeners();
  }
}
