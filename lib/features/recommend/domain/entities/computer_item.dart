import 'dart:convert';
import 'dart:math';

abstract class ComputerItem {
  final int id;
  final int price;
  final int happyId;
  final int happyPrice;
  final String image;
  final String name;
  final String details;
  final int rank;
  final double score;
  final double totalScore;
  final String shopLink;
  final String shopLogo;
  final String shopName;
  final String manufacturer;
  final int hits;

  const ComputerItem(
      {required this.id,
      required this.price,
      required this.happyId,
      required this.happyPrice,
      required this.image,
      required this.name,
      required this.details,
      required this.rank,
      required this.score,
      required this.totalScore,
      required this.shopLink,
      required this.shopLogo,
      required this.shopName,
      required this.manufacturer,
      required this.hits});

  String get partName;
  String get cheapLink {
    if (price < happyPrice) {
      return shopLink;
    }
    return 'https://shopping.pping.kr/detail/$happyId';
  }

  int get cheapPrice {
    return min(price, happyPrice);
  }

  Map<String, String> get detailsMap =>
      (json.decode(details) as Map<String, dynamic>).cast<String, String>();
}

class ComputerCPU extends ComputerItem {
  final String socket;
  final String tcp;
  final String maxClock;
  final String numCore;
  final String numThread;
  final String memoryType;
  // final String memoryClock;

  ComputerCPU(
      {required this.socket,
      required this.tcp,
      required this.maxClock,
      required this.numCore,
      required this.numThread,
      required this.memoryType,
      // required this.memoryClock,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'CPU';
}

class ComputerVGA extends ComputerItem {
  final String chipsetManufacturer;
  final String memoryCapacity;
  final String hdmi;
  final String displayPort;
  final String isSupport8K;
  final String isSupport4K;
  // final String numFan;
  final String width;
  // final String height;
  final int requiredPower;
  final int totalRank;

  ComputerVGA(
      {required this.chipsetManufacturer,
      required this.memoryCapacity,
      required this.hdmi,
      required this.displayPort,
      required this.isSupport8K,
      required this.isSupport4K,
      // required this.numFan,
      required this.width,
      // required this.height,
      required this.requiredPower,
      required super.id,
      required super.price,
      required super.happyId,
      required super.happyPrice,
      required super.image,
      required super.name,
      required super.details,
      required super.rank,
      required this.totalRank,
      required super.score,
      required super.totalScore,
      required super.shopLink,
      required super.shopLogo,
      required super.shopName,
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'GPU';
}

class ComputerRAM extends ComputerItem {
  final String useDevice;
  final String category;
  final String memoryCapacity;
  // final String clock;

  ComputerRAM(
      {required this.useDevice,
      required this.category,
      required this.memoryCapacity,
      // required this.clock,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'RAM';
}

class ComputerMainBoard extends ComputerItem {
  final String category;
  final String cpuSocket;
  final String detailChipset;
  final String formFactor;
  final String memoryType;
  final String memorySlot;
  final String memoryCapacity;
  // final String isM2;

  ComputerMainBoard(
      {required this.category,
      required this.cpuSocket,
      required this.detailChipset,
      required this.formFactor,
      required this.memoryType,
      required this.memorySlot,
      required this.memoryCapacity,
      // required this.isM2,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'MainBoard';
}

class ComputerSSD extends ComputerItem {
  // final String category;
  final String formFactor;
  // final String memoryCapacity;

  ComputerSSD(
      {
      // required this.category,
      required this.formFactor,
      // required this.memoryCapacity,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'SSD';
}

class ComputerHDD extends ComputerItem {
  final String category;
  // final String memoryCapacity;

  ComputerHDD(
      {required this.category,
      // required this.memoryCapacity,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'HDD';
}

class ComputerCooler extends ComputerItem {
  final String coolingType;
  // final String fanSize;

  ComputerCooler(
      {required this.coolingType,
      // required this.fanSize,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Cooler';
}

class ComputerPower extends ComputerItem {
  final String category;
  final int staticPower;
  final String is80Plus;
  // final String cableConnection;

  ComputerPower(
      {required this.category,
      required this.staticPower,
      required this.is80Plus,
      // required this.cableConnection,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Power';
}

class ComputerCase extends ComputerItem {
  final String category;
  final String size;
  final String supportPowerType;
  final String width;
  final String height;
  final String depth;
  // final String waterCoolerType;
  // final String topRadiator;
  // final String backwardRadiator;
  // final String forwardRadiator;

  ComputerCase(
      {required this.category,
      required this.size,
      required this.supportPowerType,
      required this.width,
      required this.height,
      required this.depth,
      // required this.waterCoolerType,
      // required this.topRadiator,
      // required this.backwardRadiator,
      // required this.forwardRadiator,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Case';
}

class ComputerMonitor extends ComputerItem {
  final String displaySize;
  final String displayRatio;
  final String panelShape;
  final String resolution;
  final String refreshRate;

  ComputerMonitor(
      {required this.displaySize,
      required this.displayRatio,
      required this.panelShape,
      required this.resolution,
      required this.refreshRate,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Monitor';
}

class ComputerKeyboard extends ComputerItem {
  final String connectionType;
  final String isGaming;

  ComputerKeyboard(
      {required this.connectionType,
      required this.isGaming,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Keyboard';
}

class ComputerMouse extends ComputerItem {
  final String connectionType;
  final String maxSensitivity;
  final String dpiModification;

  ComputerMouse(
      {required this.connectionType,
      required this.maxSensitivity,
      required this.dpiModification,
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
      required super.manufacturer,
      required super.hits});

  @override
  String get partName => 'Mouse';
}
