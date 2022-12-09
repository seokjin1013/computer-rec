// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComputerCPUModel _$ComputerCPUModelFromJson(Map<String, dynamic> json) =>
    ComputerCPUModel(
      manufacturer: json['manufacturer'] as String,
      socket: json['socket'] as String,
      tcp: json['tcp'] as String,
      maxClock: json['maxClock'] as String,
      numCore: json['numCore'] as String,
      numThread: json['numThread'] as String,
      memoryType: json['memoryType'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
      hits: json['hits'] as int? ?? 0,
    );

Map<String, dynamic> _$ComputerCPUModelToJson(ComputerCPUModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'hits': instance.hits,
      'socket': instance.socket,
      'tcp': instance.tcp,
      'maxClock': instance.maxClock,
      'numCore': instance.numCore,
      'numThread': instance.numThread,
      'memoryType': instance.memoryType,
    };

ComputerVGAModel _$ComputerVGAModelFromJson(Map<String, dynamic> json) =>
    ComputerVGAModel(
      manufacturer: json['manufacturer'] as String,
      chipsetManufacturer: json['chipsetManufacturer'] as String,
      memoryCapacity: json['memoryCapacity'] as String,
      hdmi: json['hdmi'] as String,
      displayPort: json['displayPort'] as String,
      isSupport8K: json['isSupport8K'] as String,
      isSupport4K: json['isSupport4K'] as String,
      width: json['width'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      totalRank: json['totalRank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerVGAModelToJson(ComputerVGAModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'chipsetManufacturer': instance.chipsetManufacturer,
      'memoryCapacity': instance.memoryCapacity,
      'hdmi': instance.hdmi,
      'displayPort': instance.displayPort,
      'isSupport8K': instance.isSupport8K,
      'isSupport4K': instance.isSupport4K,
      'width': instance.width,
      'totalRank': instance.totalRank,
    };

ComputerRAMModel _$ComputerRAMModelFromJson(Map<String, dynamic> json) =>
    ComputerRAMModel(
      manufacturer: json['manufacturer'] as String,
      useDevice: json['useDevice'] as String,
      memoryCapacity: json['memoryCapacity'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerRAMModelToJson(ComputerRAMModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'useDevice': instance.useDevice,
      'memoryCapacity': instance.memoryCapacity,
    };

ComputerMainBoardModel _$ComputerMainBoardModelFromJson(
        Map<String, dynamic> json) =>
    ComputerMainBoardModel(
      manufacturer: json['manufacturer'] as String,
      category: json['category'] as String,
      detailChipset: json['detailChipset'] as String,
      formFactor: json['formFactor'] as String,
      memorySlot: json['memorySlot'] as String,
      memoryCapacity: json['memoryCapacity'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerMainBoardModelToJson(
        ComputerMainBoardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'category': instance.category,
      'detailChipset': instance.detailChipset,
      'formFactor': instance.formFactor,
      'memorySlot': instance.memorySlot,
      'memoryCapacity': instance.memoryCapacity,
    };

ComputerSSDModel _$ComputerSSDModelFromJson(Map<String, dynamic> json) =>
    ComputerSSDModel(
      manufacturer: json['manufacturer'] as String,
      formFactor: json['formFactor'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerSSDModelToJson(ComputerSSDModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'formFactor': instance.formFactor,
    };

ComputerHDDModel _$ComputerHDDModelFromJson(Map<String, dynamic> json) =>
    ComputerHDDModel(
      manufacturer: json['manufacturer'] as String,
      category: json['category'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerHDDModelToJson(ComputerHDDModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'category': instance.category,
    };

ComputerCoolerModel _$ComputerCoolerModelFromJson(Map<String, dynamic> json) =>
    ComputerCoolerModel(
      manufacturer: json['manufacturer'] as String,
      coolingType: json['coolingType'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerCoolerModelToJson(
        ComputerCoolerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'coolingType': instance.coolingType,
    };

ComputerPowerModel _$ComputerPowerModelFromJson(Map<String, dynamic> json) =>
    ComputerPowerModel(
      manufacturer: json['manufacturer'] as String,
      category: json['category'] as String,
      is80Plus: json['is80Plus'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerPowerModelToJson(ComputerPowerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'category': instance.category,
      'is80Plus': instance.is80Plus,
    };

ComputerCaseModel _$ComputerCaseModelFromJson(Map<String, dynamic> json) =>
    ComputerCaseModel(
      manufacturer: json['manufacturer'] as String,
      category: json['category'] as String,
      size: json['size'] as String,
      supportPowerType: json['supportPowerType'] as String,
      width: json['width'] as String,
      height: json['height'] as String,
      depth: json['depth'] as String,
      id: json['id'] as int,
      price: json['price'] as int,
      happyId: json['happyId'] as int,
      happyPrice: json['happyPrice'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      totalScore: (json['totalScore'] as num).toDouble(),
      shopLink: json['shopLink'] as String,
      shopLogo: json['shopLogo'] as String,
      shopName: json['shopName'] as String,
    );

Map<String, dynamic> _$ComputerCaseModelToJson(ComputerCaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'happyId': instance.happyId,
      'happyPrice': instance.happyPrice,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
      'rank': instance.rank,
      'score': instance.score,
      'totalScore': instance.totalScore,
      'shopLink': instance.shopLink,
      'shopLogo': instance.shopLogo,
      'shopName': instance.shopName,
      'manufacturer': instance.manufacturer,
      'category': instance.category,
      'size': instance.size,
      'supportPowerType': instance.supportPowerType,
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
