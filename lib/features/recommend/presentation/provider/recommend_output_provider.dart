import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/no_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/program_fit.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_hit%20copy.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_program_fit.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_recommend_output.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/usecases/get_computer_item.dart';

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

  Future<Either<Failure, List<RecommendOutput>>> getRecommendOutputList(
      RecommendInput recommendInput) async {
    Either<Failure, List<RecommendOutput>> result =
        await getRecommendOutput(recommendInput);
    return result;
  }

  late Future<Either<Failure, List<RecommendOutput>>> results;
  List<Future<Either<Failure, ComputerCPU>>> cpu = [];
  List<Future<Either<Failure, ComputerVGA>>> vga = [];
  List<Future<Either<Failure, ComputerRAM>>> ram = [];
  List<Future<Either<Failure, ComputerMainBoard>>> mainboard = [];
  List<Future<Either<Failure, ComputerSSD>>> ssd = [];
  List<Future<Either<Failure, ComputerHDD>>> hdd = [];
  List<Future<Either<Failure, ComputerCooler>>> cooler = [];
  List<Future<Either<Failure, ComputerPower>>> power = [];
  List<Future<Either<Failure, ComputerCase>>> ccase = [];
  List<Future<Either<Failure, double>>> bottleneck = [];
  List<Future<Either<Failure, List<ProgramFit>>>> programFit = [];

  void setRecommendOutputList(RecommendInput recommendInput) async {
    results = getRecommendOutput(recommendInput);
    results.then((value) {
      if (value.isRight()) {
        List<RecommendOutput> r = value.asRight();
        for (int i = 0; i < r.length; ++i) {
          cpu.add(r[i].numCpu > 0
              ? getComputerCPU(r[i].cpuId)
              : Future.value(Right(NoCPU())));
          vga.add(r[i].numVga > 0
              ? getComputerVGA(r[i].vgaId)
              : Future.value(Right(NoVGA())));
          ram.add(r[i].numRam > 0
              ? getComputerRAM(r[i].ramId)
              : Future.value(Right(NoRAM())));
          mainboard.add(r[i].numMainboard > 0
              ? getComputerMainBoard(r[i].mainboardId)
              : Future.value(Right(NoMainBoard())));
          ssd.add(r[i].numSsd > 0
              ? getComputerSSD(r[i].ssdId)
              : Future.value(Right(NoSSD())));
          hdd.add(r[i].numHdd > 0
              ? getComputerHDD(r[i].hddId)
              : Future.value(Right(NoHDD())));
          cooler.add(r[i].numCooler > 0
              ? getComputerCooler(r[i].coolerId)
              : Future.value(Right(NoCooler())));
          power.add(r[i].numPower > 0
              ? getComputerPower(r[i].powerId)
              : Future.value(Right(NoPower())));
          ccase.add(r[i].numCase > 0
              ? getComputerCase(r[i].caseId)
              : Future.value(Right(NoCase())));
          bottleneck.add(Future.wait([cpu.last, vga.last]).then((value) {
            if (value[0].isLeft()) {
              return Left(value[0].asLeft());
            }
            if (value[1].isLeft()) {
              return Left(value[1].asLeft());
            }
            return getBottleneckCPUVGA(
                value[0].asRight().id, value[1].asRight().id);
          }));
          programFit.add(vga.last.then((value) {
            if (value.isLeft()) {
              return Left(value.asLeft());
            }
            return getComputerProgramFit(
                value.asRight().id, recommendInput.purpose);
          }));
        }
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
