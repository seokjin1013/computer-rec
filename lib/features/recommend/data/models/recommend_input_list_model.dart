import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/recommend_input.dart';

part 'recommend_input_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecommendInputModel extends RecommendInput {
  RecommendInputModel({
    required super.priorIntelCPU,
    required super.priorAMDCPU,
    required super.purpose,
    required super.priceLow,
    required super.priceHigh,
  });

  factory RecommendInputModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendInputModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendInputModelToJson(this);
}
