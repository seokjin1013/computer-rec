// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_fit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramFitModel _$ProgramFitModelFromJson(Map<String, dynamic> json) =>
    ProgramFitModel(
      rate: (json['rate'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProgramFitModelToJson(ProgramFitModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'name': instance.name,
    };
