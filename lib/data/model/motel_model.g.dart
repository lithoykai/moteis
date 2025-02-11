// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelModel _$MotelModelFromJson(Map json) => MotelModel(
      nameModel: json['fantasia'] as String,
      logoModel: json['logo'] as String,
      neighborhoodModel: json['bairro'] as String,
      distanceModel: (json['distancia'] as num).toDouble(),
      favoriteAmountModel: (json['qtdFavoritos'] as num).toInt(),
      suitesModel: (json['suites'] as List<dynamic>)
          .map((e) => SuiteModel.fromJson(e as Map))
          .toList(),
      numberReviewsModel: (json['qtdAvaliacoes'] as num).toInt(),
      avarageModel: (json['media'] as num).toDouble(),
    )..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$MotelModelToJson(MotelModel instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'fantasia': instance.nameModel,
      'logo': instance.logoModel,
      'bairro': instance.neighborhoodModel,
      'distancia': instance.distanceModel,
      'qtdFavoritos': instance.favoriteAmountModel,
      'suites': instance.suitesModel,
      'qtdAvaliacoes': instance.numberReviewsModel,
      'media': instance.avarageModel,
    };
