import '../repositories/recommend_repository.dart';

class GetComputerCPURanking {
  final RecommendRepository recommendRepository;

  GetComputerCPURanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerCPURanking();
  }
}

class GetComputerVGARanking {
  final RecommendRepository recommendRepository;

  GetComputerVGARanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerVGARanking();
  }
}

class GetComputerRAMRanking {
  final RecommendRepository recommendRepository;

  GetComputerRAMRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerRAMRanking();
  }
}

class GetComputerMainBoardRanking {
  final RecommendRepository recommendRepository;

  GetComputerMainBoardRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerMainBoardRanking();
  }
}

class GetComputerSSDRanking {
  final RecommendRepository recommendRepository;

  GetComputerSSDRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerSSDRanking();
  }
}

class GetComputerHDDRanking {
  final RecommendRepository recommendRepository;

  GetComputerHDDRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerHDDRanking();
  }
}

class GetComputerCoolerRanking {
  final RecommendRepository recommendRepository;

  GetComputerCoolerRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerCoolerRanking();
  }
}

class GetComputerPowerRanking {
  final RecommendRepository recommendRepository;

  GetComputerPowerRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerPowerRanking();
  }
}

class GetComputerCaseRanking {
  final RecommendRepository recommendRepository;

  GetComputerCaseRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerCaseRanking();
  }
}

class GetComputerMonitorRanking {
  final RecommendRepository recommendRepository;

  GetComputerMonitorRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerMonitorRanking();
  }
}

class GetComputerKeyboardRanking {
  final RecommendRepository recommendRepository;

  GetComputerKeyboardRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerKeyboardRanking();
  }
}

class GetComputerMouseRanking {
  final RecommendRepository recommendRepository;

  GetComputerMouseRanking(this.recommendRepository);

  Future<List<int>> call() async {
    return recommendRepository.getComputerMouseRanking();
  }
}
