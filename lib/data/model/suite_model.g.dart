// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuiteModel _$SuiteModelFromJson(Map json) => SuiteModel(
      nameModel: json['nome'] as String,
      quantityModel: (json['qtd'] as num).toInt(),
      hasAvailableModel: json['exibirQtdDisponiveis'] as bool,
      photosModel:
          (json['fotos'] as List<dynamic>).map((e) => e as String).toList(),
      itensModel: (json['itens'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map))
          .toList(),
      categoryItensModel: (json['categoriaItens'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map))
          .toList(),
      periodsModel: (json['periodos'] as List<dynamic>)
          .map((e) => PeriodModel.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$SuiteModelToJson(SuiteModel instance) =>
    <String, dynamic>{
      'nome': instance.nameModel,
      'qtd': instance.quantityModel,
      'exibirQtdDisponiveis': instance.hasAvailableModel,
      'fotos': instance.photosModel,
      'itens': instance.itensModel,
      'categoriaItens': instance.categoryItensModel,
      'periodos': instance.periodsModel,
    };

ItemModel _$ItemModelFromJson(Map json) => ItemModel(
      nameModel: json['nome'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'nome': instance.nameModel,
    };

CategoryModel _$CategoryModelFromJson(Map json) => CategoryModel(
      nameModel: json['nome'] as String,
      iconModel: json['icone'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'nome': instance.nameModel,
      'icone': instance.iconModel,
    };

PeriodModel _$PeriodModelFromJson(Map json) => PeriodModel(
      normalizedTimeModel: json['tempoFormatado'] as String,
      timeModel: json['tempo'] as String,
      priceModel: (json['valor'] as num).toDouble(),
      totalPriceModel: (json['valorTotal'] as num).toDouble(),
      hasCourtesyModel: json['temCortesia'] as bool,
      promotionModel: json['desconto'] == null
          ? null
          : PromotionModel.fromJson(json['desconto'] as Map),
    );

Map<String, dynamic> _$PeriodModelToJson(PeriodModel instance) =>
    <String, dynamic>{
      'tempoFormatado': instance.normalizedTimeModel,
      'tempo': instance.timeModel,
      'valor': instance.priceModel,
      'valorTotal': instance.totalPriceModel,
      'temCortesia': instance.hasCourtesyModel,
      'desconto': instance.promotionModel,
    };

PromotionModel _$PromotionModelFromJson(Map json) => PromotionModel(
      promotionModel: (json['desconto'] as num).toDouble(),
    );

Map<String, dynamic> _$PromotionModelToJson(PromotionModel instance) =>
    <String, dynamic>{
      'desconto': instance.promotionModel,
    };
