// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_input_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendInputModel _$RecommendInputModelFromJson(Map<String, dynamic> json) =>
    RecommendInputModel(
      priorIntelCPU: json['priorIntelCPU'] as bool? ?? false,
      priorAMDCPU: json['priorAMDCPU'] as bool? ?? false,
      purpose: json['purpose'] as int? ?? 0,
      priceLow: json['priceLow'] as int? ?? 0,
      priceHigh: json['priceHigh'] as int? ?? 0,
    );

Map<String, dynamic> _$RecommendInputModelToJson(
        RecommendInputModel instance) =>
    <String, dynamic>{
      'priorIntelCPU': instance.priorIntelCPU,
      'priorAMDCPU': instance.priorAMDCPU,
      'purpose': instance.purpose,
      'priceLow': instance.priceLow,
      'priceHigh': instance.priceHigh,
    };
