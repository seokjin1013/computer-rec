import '../../domain/entities/milestone.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/computer_item.dart';

part 'milestone_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MilestoneModel extends Milestone {
  MilestoneModel({
    required super.numUser,
    required super.numUsage,
  });

  factory MilestoneModel.fromJson(Map<String, dynamic> json) =>
      _$MilestoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$MilestoneModelToJson(this);
}
