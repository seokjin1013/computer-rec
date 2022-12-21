import 'dart:convert';

import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/recommend_input.dart';
import '../models/computer_combine_model.dart';
import '../models/computer_item_model.dart';
import '../models/milestone_model.dart';
import '../models/program_fit_model.dart';

abstract class RecommendRemoteDataSource {
  Future<List<ProgramFitModel>> getComputerProgramFit(int vgaId, int purpose);
  Future<double> getBottleneckCPUVGA(int cpuId, int vgaId);
  Future<List<RecommendOutputModel>> getRecommendOutput(
      RecommendInput recommendInput);
  Future<MilestoneModel> getMilestone();
  Future<int> getComputerCPUIdHit(int rank);
  Future<List<int>> getComputerCPUIdBestRange(int start, int end);
  Future<ComputerCPUModel> getComputerCPU(int id);
  Future<ComputerVGAModel> getComputerVGA(int id);
  Future<ComputerRAMModel> getComputerRAM(int id);
  Future<ComputerMainBoardModel> getComputerMainBoard(int id);
  Future<ComputerSSDModel> getComputerSSD(int id);
  Future<ComputerHDDModel> getComputerHDD(int id);
  Future<ComputerCoolerModel> getComputerCooler(int id);
  Future<ComputerPowerModel> getComputerPower(int id);
  Future<ComputerCaseModel> getComputerCase(int id);
  Future<ComputerMonitorModel> getComputerMonitor(int id);
  Future<ComputerKeyboardModel> getComputerKeyboard(int id);
  Future<ComputerMouseModel> getComputerMouse(int id);
  Future<bool> isExistAccount(String id, String pw);
  Future<bool> postNewAccount(String id, String pw);
}

class RecommendRemoteDataSourceImpl implements RecommendRemoteDataSource {
  final http.Client client;

  RecommendRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProgramFitModel>> getComputerProgramFit(
      int vgaId, int purpose) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/combine/rate/$vgaId/$purpose'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    final List<dynamic> outputs = json.decode(utf8.decode(response.bodyBytes));
    final List<ProgramFitModel> programFitModels = [];
    for (Map<String, dynamic> map in outputs) {
      programFitModels.add(ProgramFitModel.fromJson(map));
    }
    return programFitModels;
  }

  @override
  Future<double> getBottleneckCPUVGA(int cpuId, int vgaId) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/bottleneck/model/$cpuId/$vgaId'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    String result = response.body;
    result = result.substring(0, result.length - 1);
    return double.tryParse(result)!;
  }

  @override
  Future<List<RecommendOutputModel>> getRecommendOutput(
      RecommendInput recommendInput) async {
    int start = recommendInput.priceLow;
    int end = recommendInput.priceHigh;
    String cpu = '';
    if (recommendInput.priorIntelCPU && recommendInput.priorAMDCPU) {
      cpu = 'ANY';
    } else if (recommendInput.priorIntelCPU) {
      cpu = '인텔';
    } else if (recommendInput.priorAMDCPU) {
      cpu = 'AMD';
    }

    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/combine/csv/$start/$end/$cpu'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    final List<dynamic> outputs = json.decode(utf8.decode(response.bodyBytes));
    final List<RecommendOutputModel> recommendOutputModels = [];
    Map<String, String> renamingMap = {
      'cpu_id': 'cpuId',
      'gpu_id': 'vgaId',
      'ram_id': 'ramId',
      'mainboard_id': 'mainboardId',
      'ssd_id': 'ssdId',
      'hdd_id': 'hddId',
      'cooler_id': 'coolerId',
      'power_id': 'powerId',
      'case_id': 'caseId',
      'monitor_id': 'monitorId',
      'keyboard_id': 'keyboardId',
      'mouse_id': 'mouseId',
      'cpu_count': 'numCpu',
      'gpu_count': 'numVga',
      'ram_count': 'numRam',
      'mainboard_count': 'numMainboard',
      'ssd_count': 'numSsd',
      'hdd_count': 'numHdd',
      'cooler_count': 'numCooler',
      'power_count': 'numPower',
      'case_count': 'numCase',
      'monitor_count': 'numMonitor',
      'keyboard_count': 'numKeyboard',
      'mouse_count': 'numMouse',
      'total_price': 'totalPrice',
      'total_link': 'totalLink',
    };
    for (Map<String, dynamic> map in outputs) {
      final Map<String, dynamic> renamedMap = {
        for (MapEntry<String, dynamic> e in map.entries)
          renamingMap[e.key] ?? e.key: e.value
      };
      recommendOutputModels.add(RecommendOutputModel.fromJson(renamedMap));
    }
    return recommendOutputModels;
  }

  @override
  Future<MilestoneModel> getMilestone() async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/combine/total'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'user': 'numUser',
      'count': 'numUsage',
    };
    final Map<String, dynamic> map = json.decode(response.body);
    final Map<String, dynamic> renamedMap = {
      for (MapEntry<String, dynamic> e in map.entries)
        renamingMap[e.key] ?? e.key: e.value
    };
    return MilestoneModel.fromJson(renamedMap);
  }

  @override
  Future<int> getComputerCPUIdHit(int rank) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cpu/hits/$rank'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    final int id = json.decode(response.body);
    return id;
  }

  @override
  Future<List<int>> getComputerCPUIdBestRange(int start, int end) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cpu/model/best/$start/$end'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    final List<dynamic> ids = json.decode(utf8.decode(response.bodyBytes));
    return ids.cast<int>();
  }

  @override
  Future<ComputerCPUModel> getComputerCPU(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cpu/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '사양TDP': 'tcp',
      '사양최대 클럭': 'maxClock',
      '사양코어 수': 'numCore',
      '사양쓰레드 수': 'numThread',
      '메모리 사양메모리 규격': 'memoryType'
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerCPUModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerVGAModel> getComputerVGA(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/gpu/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '칩셋 사양칩셋 제조사': 'chipsetManufacturer',
      '메모리 사양메모리 용량': 'memoryCapacity',
      '그래픽 출력HDMI': 'hdmi',
      '그래픽 출력DisplayPort': 'displayPort',
      '부가기능8K 해상도 지원': 'isSupport8K',
      '부가기능4K 해상도 지원': 'isSupport4K',
      '제품 외형가로(길이)': 'width',
      'total_rank': 'totalRank',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerVGAModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerRAMModel> getComputerRAM(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/ram/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '사용 장치': 'useDevice',
      '메모리 용량': 'memoryCapacity',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerRAMModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerMainBoardModel> getComputerMainBoard(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/mainboard/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '기본 사양제품 분류': 'category',
      '기본 사양세부 칩셋': 'detailChipset',
      '기본 사양폼팩터': 'formFactor',
      '메모리메모리 슬롯': 'memorySlot',
      '메모리메모리 용량': 'memoryCapacity',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerMainBoardModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerSSDModel> getComputerSSD(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/ssd/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '[기본사양]폼팩터': 'formFactor',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerSSDModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerHDDModel> getComputerHDD(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/hdd/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '제품 분류': 'category',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerHDDModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerCoolerModel> getComputerCooler(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cooler/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '냉각 방식': 'coolingType',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerCoolerModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerPowerModel> getComputerPower(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/power/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '제품 분류': 'category',
      '80PLUS인증': 'is80Plus',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerPowerModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerCaseModel> getComputerCase(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/case/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '제품 분류': 'category',
      '케이스 크기': 'size',
      '지원파워규격': 'supportPowerType',
      '크기너비(W)': 'width',
      '크기깊이(D)': 'height',
      '크기높이(H)': 'depth',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerCaseModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerMonitorModel> getComputerMonitor(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/monitor/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '화면 크기': 'displaySize',
      '화면 비율': 'displayRatio',
      '패널 형태': 'panelShape',
      '해상도': 'resolution',
      '최대 주사율': 'refreshRate',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerMonitorModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerKeyboardModel> getComputerKeyboard(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/keyboard/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '연결 방식': 'connectionType',
      '게이밍마우스': 'isGaming',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerKeyboardModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  @override
  Future<ComputerMouseModel> getComputerMouse(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/mouse/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    Map<String, String> renamingMap = {
      'shop_link': 'shopLink',
      'shop_name': 'shopName',
      'shop_logo': 'shopLogo',
      'total_score': 'totalScore',
      'happy_id': 'happyId',
      'happy_price': 'happyPrice',
      '제조회사': 'manufacturer',
      '연결 방식': 'connectionType',
      '최대 감도': 'maxSensitivity',
      'DPI 변경': 'dpiModification',
    };
    final Map<String, dynamic> map =
        json.decode(utf8.decode(response.bodyBytes));
    return ComputerMouseModel.fromJson(_getFactorizedMap(map, renamingMap));
  }

  Map<String, dynamic> _getFactorizedMap(
      Map<String, dynamic> map, Map<String, String> renamingMap) {
    final details = (map['details'] as String).replaceAll("'", '"');
    final Map<String, dynamic> detailsMap = {
      for (Map<String, dynamic> e in json.decode(details))
        e.keys.first: e.values.first
    };
    map['details'] = json.encode(detailsMap);
    map.addEntries(detailsMap.entries);
    final Map<String, dynamic> renamedMap = {
      for (MapEntry<String, dynamic> e in map.entries)
        renamingMap[e.key] ?? e.key: e.value
    };
    return renamedMap;
  }

  @override
  Future<bool> isExistAccount(String id, String pw) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/user/$id/$pw'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }

    return response.body == '1';
  }

  @override
  Future<bool> postNewAccount(String id, String pw) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/newuser/$id/$pw'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return Future.error(ServerFailure(response.statusCode));
    }
    return response.body == '1';
  }
}
