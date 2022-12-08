import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/computer_item_model.dart';

abstract class RecommendRemoteDataSource {
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
  Future<bool> isExistAccount(String id, String pw);
  Future<bool> postNewAccount(String id, String pw);
}

class RecommendRemoteDataSourceImpl implements RecommendRemoteDataSource {
  final http.Client client;

  RecommendRemoteDataSourceImpl({required this.client});

  @override
  Future<List<int>> getComputerCPUIdBestRange(int start, int end) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cpu/model/best/$start/$end'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> ids = json.decode(utf8.decode(response.bodyBytes));
      return ids.cast<int>();
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerCPUModel> getComputerCPU(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cpu/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerCPUModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerVGAModel> getComputerVGA(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/gpu/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerVGAModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerRAMModel> getComputerRAM(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/ram/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerRAMModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerMainBoardModel> getComputerMainBoard(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/mainboard/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerMainBoardModel.fromJson(
          _getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerSSDModel> getComputerSSD(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/ssd/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerSSDModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerHDDModel> getComputerHDD(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/hdd/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerHDDModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerCoolerModel> getComputerCooler(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/cooler/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerCoolerModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerPowerModel> getComputerPower(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/power/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerPowerModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<ComputerCaseModel> getComputerCase(int id) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/case/model/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          json.decode(utf8.decode(response.bodyBytes));
      return ComputerCaseModel.fromJson(_getFactorizedMap(map, renamingMap));
    }
    throw ServerException(response.statusCode);
  }

  Map<String, dynamic> _getFactorizedMap(
      Map<String, dynamic> map, Map<String, String> renamingMap) {
    final details = (map['details'] as String).replaceAll("'", '"');
    final Map<String, dynamic> detailsMap = {
      for (Map<String, dynamic> e in json.decode(details))
        e.keys.first: e.values.first
    };
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

    if (response.statusCode == 200) {
      return response.body == '1';
    }
    throw ServerException(response.statusCode);
  }

  @override
  Future<bool> postNewAccount(String id, String pw) async {
    final response = await client.get(
      Uri.parse('http://175.196.11.206:8080/newuser/$id/$pw'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body == '1';
    }
    throw ServerException(response.statusCode);
  }
}
