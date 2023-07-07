import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/computer_item.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/entities/program_fit.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/repositories/recommend_repository.dart';
import '../datasources/recommend_local_data_source.dart';
import '../datasources/recommend_remote_data_source.dart';

Duration Function() delayedTime =
    () => Duration(milliseconds: Random().nextInt(400) + 800);

class RecommendRepositoryImpl implements RecommendRepository {
  final RecommendLocalDataSource localDataSource;
  final RecommendRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecommendRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<String> getTodayTip(int num) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    return localDataSource.getTodayTip(num);
  }

  @override
  Future<List<ProgramFit>> getComputerProgramFit(int vgaId, int purpose) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerProgramFit(vgaId, purpose);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<double> getBottleneckCPUVGA(int cpuId, int vgaId) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getBottleneckCPUVGA(cpuId, vgaId);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<RecommendOutput>> getRecommendOutput(
      RecommendInput recommendInput) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getRecommendOutput(recommendInput);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<Milestone> getMilestone() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getMilestone();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<int> getComputerCPUIdHit(int rank) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCPUIdHit(rank);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCPUIdBestRange(int start, int end) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCPUIdBestRange(start, end);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCPURanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCPURanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerVGARanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerVGARanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerRAMRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerRAMRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMainBoardRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMainBoardRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerSSDRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerSSDRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerHDDRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerHDDRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCoolerRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCoolerRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerPowerRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerPowerRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCaseRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCaseRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMonitorRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMonitorRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerKeyboardRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerKeyboardRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMouseRanking() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMouseRanking();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCPUReplacable(String socket) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCPUReplacable(socket);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerVGAReplacable(int power) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerVGAReplacable(power);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerRAMReplacable(String memory) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerRAMReplacable(memory);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMainBoardReplacable(
      String socket, String memory) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMainBoardReplacable(socket, memory);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerSSDReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerSSDReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerHDDReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerHDDReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCoolerReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCoolerReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerPowerReplacable(int power) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerPowerReplacable(power);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerCaseReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCaseReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMonitorReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMonitorReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerKeyboardReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerKeyboardReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<List<int>> getComputerMouseReplacable() async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMouseReplacable();
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerCPU> getComputerCPU(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCPU(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerVGA> getComputerVGA(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerVGA(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerRAM> getComputerRAM(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerRAM(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerMainBoard> getComputerMainBoard(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMainBoard(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerSSD> getComputerSSD(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerSSD(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerHDD> getComputerHDD(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerHDD(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerCooler> getComputerCooler(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCooler(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerPower> getComputerPower(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerPower(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerCase> getComputerCase(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerCase(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerMonitor> getComputerMonitor(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMonitor(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerKeyboard> getComputerKeyboard(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerKeyboard(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<ComputerMouse> getComputerMouse(int id) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.getComputerMouse(id);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<bool> isExistAccount(String id, String pw) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.isExistAccount(id, pw);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }

  @override
  Future<bool> postNewAccount(String id, String pw) async {
    if (kDebugMode) await Future.delayed(delayedTime());
    if (!await networkInfo.isConnected) {
      return Future.error(ConnectionFailure());
    }
    try {
      return remoteDataSource.postNewAccount(id, pw);
    } on ClientException {
      return Future.error(ClientFailure());
    } catch (e) {
      return Future.error(UnknownFailure());
    }
  }
}
