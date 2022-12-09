import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_hit%20copy.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_recommend_output.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/computer_combine.dart';
import '../../domain/entities/recommend_input_list.dart';
import '../../domain/usecases/get_computer_item.dart';

class RecommendOutputProvider with ChangeNotifier {
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

  late Either<Failure, List<RecommendOutput>> results;
  List<Either<Failure, ComputerCPU>?> cpu = [];
  List<Either<Failure, ComputerVGA>?> vga = [];
  List<Either<Failure, ComputerRAM>?> ram = [];
  List<Either<Failure, ComputerMainBoard>?> mainboard = [];
  List<Either<Failure, ComputerSSD>?> ssd = [];
  List<Either<Failure, ComputerHDD>?> hdd = [];
  List<Either<Failure, ComputerCooler>?> cooler = [];
  List<Either<Failure, ComputerPower>?> power = [];
  List<Either<Failure, ComputerCase>?> ccase = [];
  List<Either<Failure, double>?> bottleneck = [];

  late Future<Either<Failure, List<RecommendOutput>>> resultsReady;
  List<Future<Either<Failure, ComputerCPU>>> cpuReady = [];
  List<Future<Either<Failure, ComputerVGA>>> vgaReady = [];
  List<Future<Either<Failure, ComputerRAM>>> ramReady = [];
  List<Future<Either<Failure, ComputerMainBoard>>> mainboardReady = [];
  List<Future<Either<Failure, ComputerSSD>>> ssdReady = [];
  List<Future<Either<Failure, ComputerHDD>>> hddReady = [];
  List<Future<Either<Failure, ComputerCooler>>> coolerReady = [];
  List<Future<Either<Failure, ComputerPower>>> powerReady = [];
  List<Future<Either<Failure, ComputerCase>>> ccaseReady = [];
  List<Future<Either<Failure, double>>> bottleneckReady = [];

  void setRecommendOutputList(RecommendInput recommendInput) async {
    resultsReady = getRecommendOutput(recommendInput);
    resultsReady.then((value) {
      results = value;
      if (value.isRight()) {
        List<RecommendOutput> r = value.asRight();
        cpu = List.filled(r.length, null);
        vga = List.filled(r.length, null);
        ram = List.filled(r.length, null);
        mainboard = List.filled(r.length, null);
        ssd = List.filled(r.length, null);
        hdd = List.filled(r.length, null);
        cooler = List.filled(r.length, null);
        power = List.filled(r.length, null);
        ccase = List.filled(r.length, null);
        bottleneck = List.filled(r.length, null);
        for (int i = 0; i < r.length; ++i) {
          cpuReady.add(getComputerCPU(r[i].cpuId)
            ..then(
              (value) => cpu[i] = value,
            ));
          vgaReady.add(getComputerVGA(r[i].vgaId)
            ..then(
              (value) => vga[i] = value,
            ));
          ramReady.add(getComputerRAM(r[i].ramId)
            ..then(
              (value) => ram[i] = value,
            ));
          mainboardReady.add(getComputerMainBoard(r[i].mainboardId)
            ..then(
              (value) => mainboard[i] = value,
            ));
          ssdReady.add(getComputerSSD(r[i].ssdId)
            ..then(
              (value) => ssd[i] = value,
            ));
          hddReady.add(getComputerHDD(r[i].hddId)
            ..then(
              (value) => hdd[i] = value,
            ));
          coolerReady.add(getComputerCooler(r[i].coolerId)
            ..then(
              (value) => cooler[i] = value,
            ));
          powerReady.add(getComputerPower(r[i].powerId)
            ..then(
              (value) => power[i] = value,
            ));
          ccaseReady.add(getComputerCase(r[i].caseId)
            ..then(
              (value) => ccase[i] = value,
            ));
          bottleneckReady
              .add(Future.wait([cpuReady[i], vgaReady[i]]).then((value) {
            if (value[0].isLeft()) {
              return Left(value[0].asLeft());
            }
            if (value[1].isLeft()) {
              return Left(value[1].asLeft());
            }
            return getBottleneckCPUVGA(
                value[0].asRight().id, value[1].asRight().id)
              ..then(
                (value) => bottleneck[i] = value,
              );
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
