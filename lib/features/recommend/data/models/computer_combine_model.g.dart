// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_combine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendOutputModel _$RecommendOutputModelFromJson(
        Map<String, dynamic> json) =>
    RecommendOutputModel(
      cpuId: json['cpuId'] as int,
      vgaId: json['vgaId'] as int,
      ramId: json['ramId'] as int,
      mainboardId: json['mainboardId'] as int,
      ssdId: json['ssdId'] as int,
      hddId: json['hddId'] as int,
      coolerId: json['coolerId'] as int,
      powerId: json['powerId'] as int,
      caseId: json['caseId'] as int,
      numCpu: json['numCpu'] as int,
      numVga: json['numVga'] as int,
      numRam: json['numRam'] as int,
      numMainboard: json['numMainboard'] as int,
      numSsd: json['numSsd'] as int,
      numHdd: json['numHdd'] as int,
      numCooler: json['numCooler'] as int,
      numPower: json['numPower'] as int,
      numCase: json['numCase'] as int,
      totalPrice: json['totalPrice'] as int,
      totalLink: json['totalLink'] as String,
    );

Map<String, dynamic> _$RecommendOutputModelToJson(
        RecommendOutputModel instance) =>
    <String, dynamic>{
      'cpuId': instance.cpuId,
      'vgaId': instance.vgaId,
      'ramId': instance.ramId,
      'mainboardId': instance.mainboardId,
      'ssdId': instance.ssdId,
      'hddId': instance.hddId,
      'coolerId': instance.coolerId,
      'powerId': instance.powerId,
      'caseId': instance.caseId,
      'numCpu': instance.numCpu,
      'numVga': instance.numVga,
      'numRam': instance.numRam,
      'numMainboard': instance.numMainboard,
      'numSsd': instance.numSsd,
      'numHdd': instance.numHdd,
      'numCooler': instance.numCooler,
      'numPower': instance.numPower,
      'numCase': instance.numCase,
      'totalPrice': instance.totalPrice,
      'totalLink': instance.totalLink,
    };
