import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/program_fit.dart';

part 'program_fit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramFitModel extends ProgramFit {
  ProgramFitModel({
    required super.rate,
    required super.name,
  });

  factory ProgramFitModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramFitModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramFitModelToJson(this);
}
