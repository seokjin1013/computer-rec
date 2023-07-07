import '../repositories/recommend_repository.dart';

class GetComputerCPUReplacable {
  final RecommendRepository recommendRepository;

  GetComputerCPUReplacable(this.recommendRepository);

  Future<List<int>> call(String socket) async {
    return recommendRepository.getComputerCPUReplacable(socket);
  }
}

class GetComputerVGAReplacable {
  final RecommendRepository recommendRepository;

  GetComputerVGAReplacable(this.recommendRepository);

  Future<List<int>> call(int power) async {
    return recommendRepository.getComputerVGAReplacable(power);
  }
}

class GetComputerRAMReplacable {
  final RecommendRepository recommendRepository;

  GetComputerRAMReplacable(this.recommendRepository);

  Future<List<int>> call(String memory) async {
    return recommendRepository.getComputerRAMReplacable(memory);
  }
}

class GetComputerMainBoardReplacable {
  final RecommendRepository recommendRepository;

  GetComputerMainBoardReplacable(this.recommendRepository);

  Future<List<int>> call(String socket, String memory) async {
    return recommendRepository.getComputerMainBoardReplacable(socket, memory);
  }
}

class GetComputerSSDReplacable {
  final RecommendRepository recommendRepository;

  GetComputerSSDReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerSSDReplacable();
  }
}

class GetComputerHDDReplacable {
  final RecommendRepository recommendRepository;

  GetComputerHDDReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerHDDReplacable();
  }
}

class GetComputerCoolerReplacable {
  final RecommendRepository recommendRepository;

  GetComputerCoolerReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerCoolerReplacable();
  }
}

class GetComputerPowerReplacable {
  final RecommendRepository recommendRepository;

  GetComputerPowerReplacable(this.recommendRepository);

  Future<List<int>> call(int power) async {
    return recommendRepository.getComputerPowerReplacable(power);
  }
}

class GetComputerCaseReplacable {
  final RecommendRepository recommendRepository;

  GetComputerCaseReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerCaseReplacable();
  }
}

class GetComputerMonitorReplacable {
  final RecommendRepository recommendRepository;

  GetComputerMonitorReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerMonitorReplacable();
  }
}

class GetComputerKeyboardReplacable {
  final RecommendRepository recommendRepository;

  GetComputerKeyboardReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerKeyboardReplacable();
  }
}

class GetComputerMouseReplacable {
  final RecommendRepository recommendRepository;

  GetComputerMouseReplacable(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerMouseReplacable();
  }
}
