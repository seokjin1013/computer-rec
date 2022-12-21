import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_replacable.dart';

import '../entities/computer_item.dart';
import '../entities/milestone.dart';
import '../entities/program_fit.dart';
import '../entities/recommend_input.dart';
import '../entities/recommend_output.dart';

abstract class RecommendRepository {
  Future<String> getTodayTip(int num);
  Future<List<ProgramFit>> getComputerProgramFit(int vgaId, int purpose);
  Future<double> getBottleneckCPUVGA(int cpuId, int vgaId);
  Future<List<RecommendOutput>> getRecommendOutput(
      RecommendInput recommendInput);
  Future<Milestone> getMilestone();
  Future<int> getComputerCPUIdHit(int rank);
  Future<List<int>> getComputerCPUIdBestRange(int start, int end);
  Future<List<int>> getComputerCPUReplacable(String socket);
  Future<List<int>> getComputerVGAReplacable(int power);
  Future<List<int>> getComputerRAMReplacable(String memory);
  Future<List<int>> getComputerMainBoardReplacable(
      String socket, String memory);
  Future<List<int>> getComputerSSDReplacable();
  Future<List<int>> getComputerHDDReplacable();
  Future<List<int>> getComputerCoolerReplacable();
  Future<List<int>> getComputerPowerReplacable(int power);
  Future<List<int>> getComputerCaseReplacable();
  Future<List<int>> getComputerMonitorReplacable();
  Future<List<int>> getComputerKeyboardReplacable();
  Future<List<int>> getComputerMouseReplacable();
  Future<ComputerCPU> getComputerCPU(int id);
  Future<ComputerVGA> getComputerVGA(int id);
  Future<ComputerRAM> getComputerRAM(int id);
  Future<ComputerMainBoard> getComputerMainBoard(int id);
  Future<ComputerSSD> getComputerSSD(int id);
  Future<ComputerHDD> getComputerHDD(int id);
  Future<ComputerCooler> getComputerCooler(int id);
  Future<ComputerPower> getComputerPower(int id);
  Future<ComputerCase> getComputerCase(int id);
  Future<ComputerMonitor> getComputerMonitor(int id);
  Future<ComputerKeyboard> getComputerKeyboard(int id);
  Future<ComputerMouse> getComputerMouse(int id);
  Future<bool> isExistAccount(String id, String pw);
  Future<bool> postNewAccount(String id, String pw);
}
