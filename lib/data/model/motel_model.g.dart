// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelModel _$MotelModelFromJson(Map json) => MotelModel(
      fantasiaModel: json['fantasia'] as String,
      logoModel: json['logo'] as String,
      bairroModel: json['bairro'] as String,
      distanciaModel: (json['distancia'] as num).toDouble(),
      qtdFavoritosModel: (json['qtdFavoritos'] as num).toInt(),
      suitesModel: (json['suites'] as List<dynamic>)
          .map((e) => SuiteModel.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$MotelModelToJson(MotelModel instance) =>
    <String, dynamic>{
      'fantasia': instance.fantasiaModel,
      'logo': instance.logoModel,
      'bairro': instance.bairroModel,
      'distancia': instance.distanciaModel,
      'qtdFavoritos': instance.qtdFavoritosModel,
      'suites': instance.suitesModel,
    };
