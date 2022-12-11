import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/computer_item.dart';

part 'computer_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ComputerCPUModel extends ComputerCPU {
  ComputerCPUModel({
    required super.manufacturer,
    required super.socket,
    required super.tcp,
    required super.maxClock,
    required super.numCore,
    required super.numThread,
    required super.memoryType,
    // required super.memoryClock,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerCPUModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerCPUModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerCPUModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerVGAModel extends ComputerVGA {
  ComputerVGAModel({
    required super.manufacturer,
    required super.chipsetManufacturer,
    required super.memoryCapacity,
    required super.hdmi,
    required super.displayPort,
    required super.isSupport8K,
    required super.isSupport4K,
    // required super.numFan,
    required super.width,
    // required super.height,
    // required super.requiredPower,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.totalRank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerVGAModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerVGAModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerVGAModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerRAMModel extends ComputerRAM {
  ComputerRAMModel({
    required super.manufacturer,
    required super.useDevice,
    // required super.category,
    required super.memoryCapacity,
    // required super.clock,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerRAMModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerRAMModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerRAMModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerMainBoardModel extends ComputerMainBoard {
  ComputerMainBoardModel({
    required super.manufacturer,
    required super.category,
    // required super.cpuSocket,
    required super.detailChipset,
    required super.formFactor,
    // required super.memoryType,
    required super.memorySlot,
    required super.memoryCapacity,
    // required super.isM2,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerMainBoardModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerMainBoardModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerMainBoardModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerSSDModel extends ComputerSSD {
  ComputerSSDModel({
    required super.manufacturer,
    // required super.category,
    required super.formFactor,
    // required super.memoryCapacity,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerSSDModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerSSDModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerSSDModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerHDDModel extends ComputerHDD {
  ComputerHDDModel({
    required super.manufacturer,
    required super.category,
    // required super.memoryCapacity,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerHDDModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerHDDModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerHDDModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerCoolerModel extends ComputerCooler {
  ComputerCoolerModel({
    required super.manufacturer,
    required super.coolingType,
    // required super.fanSize,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerCoolerModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerCoolerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerCoolerModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerPowerModel extends ComputerPower {
  ComputerPowerModel({
    required super.manufacturer,
    required super.category,
    // required super.staticPower,
    required super.is80Plus,
    // required super.cableConnection,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerPowerModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerPowerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerPowerModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComputerCaseModel extends ComputerCase {
  ComputerCaseModel({
    required super.manufacturer,
    required super.category,
    required super.size,
    required super.supportPowerType,
    required super.width,
    required super.height,
    required super.depth,
    // required super.waterCoolerType,
    // required super.topRadiator,
    // required super.backwardRadiator,
    // required super.forwardRadiator,
    required super.id,
    required super.price,
    required super.happyId,
    required super.happyPrice,
    required super.image,
    required super.name,
    required super.details,
    required super.rank,
    required super.score,
    required super.totalScore,
    required super.shopLink,
    required super.shopLogo,
    required super.shopName,
    required super.hits,
  });

  factory ComputerCaseModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerCaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerCaseModelToJson(this);
}
