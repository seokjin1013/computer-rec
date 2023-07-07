import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recommend_output.dart';

part 'computer_combine_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecommendOutputModel extends RecommendOutput {
  RecommendOutputModel({
    required super.cpuId,
    required super.vgaId,
    required super.ramId,
    required super.mainboardId,
    required super.ssdId,
    required super.hddId,
    required super.coolerId,
    required super.powerId,
    required super.caseId,
    required super.monitorId,
    required super.keyboardId,
    required super.mouseId,
    required super.numCpu,
    required super.numVga,
    required super.numRam,
    required super.numMainboard,
    required super.numSsd,
    required super.numHdd,
    required super.numCooler,
    required super.numPower,
    required super.numCase,
    required super.numMonitor,
    required super.numKeyboard,
    required super.numMouse,
    required super.totalPrice,
    required super.totalLink,
  });

  factory RecommendOutputModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendOutputModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendOutputModelToJson(this);
}
